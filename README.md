# .emacs.d.shell

A **lightweight** emacs configuration file,
can work **independently** of the main emacs configuration file (such as spacemacs).
Mainly used for simple editing of files.

### Install

```shell
git clone https://github.com/chougousui/.emacs.d.shell.git
```

### Suggested zsh alias

```
alias ema="emacs -q --load ~/.emacs.d.shell/init.el"
alias em="emacs -q --load ~/.emacs.d.shell/init.el -nw"
```

### Features

- swiper
- counsel
- counsel-projectile
- company
- popwin
- which-key
- winum
- spaceline
- etc.