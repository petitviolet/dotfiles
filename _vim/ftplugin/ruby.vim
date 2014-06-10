call smartinput#map_to_trigger('i', '#', '#', '#')
call smartinput#define_rule({
      \ 'at': '\%#',
      \ 'char': '#',
      \ 'input': '#{}<Left>',
      \ 'filetype': ['ruby'],
      \ 'syntax': ['Constant', 'Special'],
      \ })

call smartinput#define_rule({
      \ 'at': '\({\|\<do\>\)\s*\%#',
      \ 'char': '<Bar>',
      \ 'input': '<Bar><Bar><Left>',
      \ 'filetype': ['ruby'],
      \ })
