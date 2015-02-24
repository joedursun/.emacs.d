Included are a few themes, clojure and ruby packages, and basic configuration to make development easier. This configuration is set up to emulate a lot of the most used features of Textmate/Sublime Text with a few extra add-ons.

List of commonly used keybindings

Keybinding         | Description
-------------------|------------------------------------------------------------
<kbd>s-p</kbd> | Switch between projects using projectile
<kbd>s-f</kbd> | Search in project using ag-regexp
<kbd>s-d</kbd> | Switch to different directory in project
<kbd>s-t</kbd> | Open file in project (fuzzy matching)
<kbd>s-<mouse-1></kbd> | Add another cursor
<kbd>C-N</kbd> | Mark next occurence of selection
<kbd>C-t</kbd> | Delete contents of current form (mostly for Clojure; useful in JS and Go files as well)
<kbd>s-r</kbd> | Replace string
<kbd>C-b</kbd> | Jump backward one word
<kbd>C-f</kbd> | Jump forward one word
<kbd>s-l</kbd> | Go to line
<kbd>s-]</kbd> | Right indent
<kbd>s-[</kbd> | Left indent
<kbd>C--</kbd> | Delete line
<kbd>C-c p k</kbd> | Kill all project buffers
<kbd>s-T</kbd> | Jump to method
<kbd>s-<up></kbd> | Go to beginning of buffer
<kbd>s-<down></kbd> | Go to end of buffer
<kbd>s-<left></kbd> | Go back to first non-whitespace character on line
<kbd>s-k</kbd> | Kill current buffer
<kbd>C-c SPC</kbd> | Jump to word (ace-jump-word-mode)
<kbd>F8</kbd> | Toggle Neotree
<kbd>C-c i m</kbd> | Importmagic fixup (python mode)
Rails project specific keybindings can be found [here](https://github.com/asok/projectile-rails#interactive-commands)
