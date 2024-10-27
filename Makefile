HOMEFILES := $(shell ls -A src)
DOTFILES := $(addprefix $(HOME)/.,$(HOMEFILES))
CONTAINER_NAME = dotfiles

.PHONEY: install link unlink install_brew

link: | $(DOTFILES)

install: link install_prezto

$(DOTFILES):
	@ln -sv "$(PWD)/src/$(patsubst .%,%,$(notdir $@))" $@

debug:
	@echo "Source Files: $(DOTFILES)"
	@echo "Home Files: $(HOMEFILES)"

unlink:
	@echo "Unlinking dotfiles"
	@for f in $(DOTFILES); do if [ -h $$f ]; then rm -i $$f; fi ; done

install_prezto:
	rm -rf $$HOME/.zprezto
	git clone --recursive https://github.com/sorin-ionescu/prezto.git "$(HOME)/.zprezto"
	for rcfile in "$(HOME)"/.zprezto/runcoms/^README.md\(.N\); do ln -s "$rcfile" "$(HOME)/.$(rcfile:t)"; done
	chsh -s /bin/zsh
	@echo "Open a new terminal window."

install_brew:
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew_libs:
	brew install \
		z \
		gpg2 \
		graphicsmagick \
		imagemagick \
		nano \
		git \
		tree \
		htop \
		ssh-copy-id \
		colordiff \
		tmux \
		httpie \
		neovim \
		reattach-to-user-namespace

brew_cask:
	brew cask install \
		alfred \
		the-unarchiver \
		spotify \
		google-chrome \
		firefox \
		slack \
		1password \
		caffeine \
		insomnia \
		vlc \
		flux

# development

build:
	@docker build --tag=$(CONTAINER_NAME) .

restart:
	@docker container restart $(CONTAINER_NAME)

enter:
	@docker exec -it $(CONTAINER_NAME) bash

run:
	@docker run --rm -d -it -v $(PWD):/home/tester/dotfiles --name $(CONTAINER_NAME) $(CONTAINER_NAME)
