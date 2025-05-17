if "WAYLAND_DISPLAY" in $env {
  $env.config.keybindings ++= [{
            name: copy_selection
            modifier: control
            keycode: char_c
            mode: emacs
            event: { edit: copyselectionsystem }
        }
        {
            name: cut_selection
            modifier: control_shift
            keycode: char_x
            mode: emacs
            event: { edit: cutselectionsystem }
        }
        {
            name: paste
            modifier: control
            keycode: char_v
            mode: emacs
            event: { edit: pastesystem }
        }] 
} else {
  $env.config.keybindings ++= [{
            name: copy_selection
            modifier: control
            keycode: char_c
            mode: emacs
            event: { edit: copyselection }
        }
        {
            name: cut_selection
            modifier: control_shift
            keycode: char_x
            mode: emacs
            event: { edit: cutselection }
        }
        {
            name: paste
            modifier: control
            keycode: char_v
            mode: emacs
            event: { edit: paste }
        }] 
}

$env.config.keybindings ++= [
        {
            name: completion_menu
            modifier: none
            keycode: tab
            mode: [emacs vi_normal vi_insert]
            event: {
                until: [
                    { send: menu name: completion_menu }
                    { send: menunext }
                    { edit: complete }
                ]
            }
        }
        {
            name: ide_completion_menu
            modifier: control
            keycode: char_n
            mode: [emacs vi_normal vi_insert]
            event: {
                until: [
                    { send: menu name: ide_completion_menu }
                    { send: menunext }
                    { edit: complete }
                ]
            }
        }
        {
            name: help_menu
            modifier: none
            keycode: f1
            mode: [emacs, vi_insert, vi_normal]
            event: { send: menu name: help_menu }
        }
        {
            name: completion_previous_menu
            modifier: shift
            keycode: backtab
            mode: [emacs, vi_normal, vi_insert]
            event: { send: menuprevious }
        }
        {
            name: next_page_menu
            modifier: control
            keycode: char_x
            mode: emacs
            event: { send: menupagenext }
        }
        {
            name: undo_or_previous_page_menu
            modifier: control
            keycode: char_z
            mode: emacs
            event: {
                until: [
                    { send: menupageprevious }
                    { edit: undo }
                ]
            }
        }
       {
            name: clear_screen
            modifier: control
            keycode: char_l
            mode: [emacs, vi_normal, vi_insert]
            event: { send: clearscreen }
        }
        {
            name: move_up
            modifier: none
            keycode: up
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: menuup }
                    { send: up }
                ]
            }
        }
        {
            name: move_down
            modifier: none
            keycode: down
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: menudown }
                    { send: down }
                ]
            }
        }
        {
            name: move_left
            modifier: none
            keycode: left
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: menuleft }
                    { send: left }
                ]
            }
        }
        {
            name: move_right_or_take_history_hint
            modifier: none
            keycode: right
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: historyhintcomplete }
                    { send: menuright }
                    { send: right }
                ]
            }
        }
        {
            name: move_one_word_left
            modifier: control
            keycode: left
            mode: [emacs, vi_normal, vi_insert]
            event: { edit: movewordleft }
        }
        {
            name: move_one_word_right_or_take_history_hint
            modifier: control
            keycode: right
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: historyhintwordcomplete }
                    { edit: movewordright }
                ]
            }
        }
        {
            name: move_to_line_start
            modifier: none
            keycode: home
            mode: [emacs, vi_normal, vi_insert]
            event: { edit: movetolinestart }
        }
        {
            name: move_to_line_start
            modifier: control
            keycode: char_a
            mode: [emacs, vi_normal, vi_insert]
            event: { edit: movetolinestart }
        }
        {
            name: move_to_line_end_or_take_history_hint
            modifier: none
            keycode: end
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: historyhintcomplete }
                    { edit: movetolineend }
                ]
            }
        }
        {
            name: move_to_line_end_or_take_history_hint
            modifier: control
            keycode: char_e
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: historyhintcomplete }
                    { edit: movetolineend }
                ]
            }
        }
        {
            name: move_to_line_start
            modifier: control
            keycode: home
            mode: [emacs, vi_normal, vi_insert]
            event: { edit: movetolinestart }
        }
        {
            name: move_to_line_end
            modifier: control
            keycode: end
            mode: [emacs, vi_normal, vi_insert]
            event: { edit: movetolineend }
        }
        {
            name: move_up
            modifier: control
            keycode: char_p
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: menuup }
                    { send: up }
                ]
            }
        }
        {
            name: move_down
            modifier: control
            keycode: char_t
            mode: [emacs, vi_normal, vi_insert]
            event: {
                until: [
                    { send: menudown }
                    { send: down }
                ]
            }
        }
        {
            name: delete_one_character_backward
            modifier: none
            keycode: backspace
            mode: [emacs, vi_insert]
            event: { edit: backspace }
        }
        {
            name: delete_one_word_forward
            modifier: control
            keycode: delete
            mode: [emacs, vi_insert]
            event: { edit: backspaceword }
        }
        {
            name: delete_one_word_backward
            modifier: control
            keycode: backspace
            mode: [emacs, vi_insert]
            event: { edit: backspaceword }
        }
        {
            name: delete_one_character_forward
            modifier: none
            keycode: delete
            mode: [emacs, vi_insert]
            event: { edit: delete }
        }
        {
            name: redo_change
            modifier: control
            keycode: char_g
            mode: emacs
            event: { edit: redo }
        }
        {
            name: undo_change
            modifier: control
            keycode: char_z
            mode: emacs
            event: { edit: undo }
        }
        {
            name: paste_before
            modifier: control
            keycode: char_y
            mode: emacs
            event: { edit: pastecutbufferbefore }
        }
        {
            name: cut_word_left
            modifier: control
            keycode: char_w
            mode: emacs
            event: { edit: cutwordleft }
        }
        {
            name: cut_line_to_end
            modifier: control
            keycode: char_k
            mode: emacs
            event: { edit: cuttoend }
        }
        {
            name: cut_line_from_start
            modifier: control
            keycode: char_u
            mode: emacs
            event: { edit: cutfromstart }
        }
        {
            name: select_all
            modifier: control
            keycode: char_a
            mode: emacs
            event: { edit: selectall }
        }
        {
            name: 'fzf'
            modifier: control
            keycode: char_t
            mode: [emacs vi_normal]
            event: [{
                send: ExecuteHostCommand
                cmd: "commandline edit -i (fzf)"
            }]
        }]
