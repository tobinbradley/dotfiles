# dotfiles

Ye olde dot files. Do with them as you will.

Literally every line of code was was pried out of the dot files of smarter people than I, too many people for me to name, or unfortunately, remember. If you see something in here you wrote, thank you.

I'm assuming some things here:

* You have zsh, tmux, and vim installed, with vim 8 or higher for a few plugins
* You're using oh-my-zsh
* For linting and auto-completion, I have nodejs installed with eslint, csslint, eslint-plugin-vue, prettier, and javascript-typescript-langserver. Add more stuff as needed.

There's a setup script that clone's the repo, backs up your existing .vimrc/.zshrc/.tmux.conf files, links the ones in the repo, sets up vim-plug and installs plugins. If you don't run it from inside the dotfiles folder, your life will become a furious ball of nothing.

Or, you know, just copy and paste as you will.

Enjoy!
