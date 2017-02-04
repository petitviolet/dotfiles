const {classes: Cc, interfaces: Ci, utils: Cu} = Components;
const gClipboardHelper = Cc['@mozilla.org/widget/clipboardhelper;1']
  .getService(Ci.nsIClipboardHelper);
const {Preferences} = Cu.import('resource://gre/modules/Preferences.jsm', {});

const FIREFOX_PREFS = {
  'browser.startup.page': 3,
  'browser.tabs.animate': false,
  'browser.search.suggest.enabled': true,
  'browser.urlbar.suggest.searches': true,
  'browser.urlbar.maxRichResults': 20,
  'dom.ipc.processCount': 2,
  'browser.tabs.remote.force-enable': true,
  'extensions.e10sBlockedByAddons': false,
  'extensions.e10sBlocksEnabling': false
};

const VIMFX_PREFS = {
  'prevent_autofocus': true
};

const MAPPINGS = {
  "prevent_autofocus": true,
  "config_file_directory": "~/.config/vimfx",
  "mode.normal.focus_location_bar": "T",
  "mode.normal.paste_and_go": "pp",
  "mode.normal.copy_current_url": "y",
  "mode.normal.go_home": "",
  "mode.normal.stop": "<c-escape>",
  "mode.normal.stop_all": "a<c-escape>",
  "mode.normal.scroll_left": "",
  "mode.normal.scroll_right": "",
  "mode.normal.scroll_page_down": "<c-f>",
  "mode.normal.scroll_page_up": "<c-b>",
  "mode.normal.scroll_half_page_down": "<c-d>",
  "mode.normal.scroll_half_page_up": "<c-u>",
  "mode.normal.tab_new": "n",
  "mode.normal.tab_new_after_current": "t",
  "mode.normal.tab_duplicate": "T",
  "mode.normal.tab_select_previous": "h",
  "mode.normal.tab_select_next": "l",
  "mode.normal.tab_select_first_non_pinned": "^",
  "mode.normal.tab_select_last": "$",
  "mode.normal.tab_close": "dd",
  "mode.normal.tab_restore": "u",
  "mode.normal.tab_restore_list": "U",
  "mode.normal.tab_close_to_end": "",
  "mode.normal.tab_close_other": "",
  "mode.normal.enter_mode_ignore": "I",
  "mode.normal.quote": "i",
  "mode.normal.reload_config_file": "<c-s>",
  "mode.find.exit": "<escape>",

  // custom
  'custom.mode.normal.search_selected_text': 's',
  'custom.mode.normal.url_increment': '<c-a>',
  'custom.mode.normal.url_decrement': '<c-x>',
  'custom.mode.normal.copy_selection_or_url': 'S',
  'custom.mode.normal.copy_as_markdown': 'Y',

  // not working...
  'custom.mode.normal.slideshare_player_next': '<c-k>',
  'custom.mode.normal.slideshare_player_prev': '<c-j>'
};

const {commands} = vimfx.modes.normal;

const CUSTOM_COMMANDS = [
  [{
    name: 'search_selected_text',
    description: 'Search for the selected text'
  }, ({vim}) => {
    vimfx.send(vim, 'getSelection', true, selection => {
      if (selection != '') {
        vim.window.switchToTabHavingURI(`https://www.google.co.jp/search?q=${selection}`, true);
      }
    });
  }],
  [{
    name: 'copy_as_markdown',
    description: 'Copy title and url as Markdown',
    category: 'location',
    order: commands.copy_current_url.order + 2
  }, ({vim}) => {
    let url = vim.window.gBrowser.selectedBrowser.currentURI.spec;
    let title = vim.window.gBrowser.selectedBrowser.contentTitle;
    let s = `[${title}](${url})`;
    gClipboardHelper.copyString(s);
    vim.notify(`Copied to clipboard: ${s}`);
  }],
  [{
    name: 'copy_selection_or_url',
    description: 'Copy the selection or current url',
    category: 'location',
    order: commands.copy_current_url.order + 1
  }, ({vim}) => {
    vimfx.send(vim, 'getSelection', true, selection => {
      if (selection == '') {
        selection = vim.window.gBrowser.selectedBrowser.currentURI.spec;
      }
      gClipboardHelper.copyString(selection);
      vim.notify(`Copied to clipboard: ${selection}`);
    });
  }],
  [{
    name: 'url_increment',
    description: 'c_URLインクリメント',
    category: 'misc',
  }, ({vim}) => {
    let url = vim.window.gBrowser.selectedBrowser.currentURI.spec;
    if (url.match(/(\d+)(\D*)$/)) {
      var alter = String( Number(RegExp.$1) +1);
      var blank = "";
      for (i=0; i < RegExp.$1.length-alter.length; i++) {
        blank += "0";
      }
      var next = RegExp.leftContext + blank + alter + RegExp.$2;
      vim.window.gBrowser.loadURI(next);
    }
  }],
  [{
    name: 'url_decrement',
    description: 'c_URLデクリメント',
    category: 'misc',
  }, ({vim}) => {
    let url = vim.window.gBrowser.selectedBrowser.currentURI.spec;
    if (url.match(/(\d+)(\D*)$/)) {
      var alter = String( Number(RegExp.$1) -1);
      var blank = "";
      for (i=0; i < RegExp.$1.length-alter.length; i++) {
        blank += "0";
      }
      var next = RegExp.leftContext + blank + alter + RegExp.$2;
      vim.window.gBrowser.loadURI(next);
    }
  }],
  [{
    name: 'slideshare_player_prev',
    description: 'SlideShare: 前のページ',
    category: 'misc'
  }, ({vim}) => {
    vimfx.send(vim, 'vimfxSlideShare', true, (player) => {
      // console.info('player: ', player);
      // play.prev();
      vim.notify("slideshare prev");
    });
  }],
  [{
    name: 'slideshare_player_next',
    description: 'SlideShare: 次のページ',
    category: 'misc'
  }, ({vim}) => {
    vimfx.send(vim, 'vimfxSlideShare', true, (player) => {
      console.dir(player);
      // player.next;
      vim.notify(`slideshare next: ${player.show()}`);
    });
  }]
];

Object.entries(VIMFX_PREFS).forEach(([name, value]) => {
  vimfx.set(name, value);
});

CUSTOM_COMMANDS.forEach(([options, fn]) => {
  vimfx.addCommand(options, fn);
});

Object.entries(MAPPINGS).forEach(([cmd, key]) => {
  vimfx.set(cmd, key);
});

Preferences.set(FIREFOX_PREFS);
