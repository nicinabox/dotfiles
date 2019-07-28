HOMEFILES := $(shell ls -A src)
DOTFILES := $(addprefix $(HOME)/.,$(HOMEFILES))
CONTAINER_NAME = dotfiles

.PHONEY: preinstall install link unlink brew

preinstall: prezto

install: preinstall link

link: | $(DOTFILES)

$(DOTFILES):
	@ln -sv "$(PWD)/src/$(patsubst .%,%,$(notdir $@))" $@

unlink:
	@echo "Unlinking dotfiles"
	@for f in $(DOTFILES); do if [ -h $$f ]; then rm -i $$f; fi ; done

prezto:
	rm -rf $$HOME/.zprezto
	git clone --recursive https://github.com/sorin-ionescu/prezto.git "$(HOME)/.zprezto"
	for rcfile in "$(HOME)"/.zprezto/runcoms/^README.md\(.N\); do; ln -s "$rcfile" "$(HOME)/.$(rcfile:t)"; done
	chsh -s /bin/zsh
	@echo "Open a new terminal window."

brew:
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew_libs:
	brew install \
		zsh \
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
		zsh-syntax-highlighting \
		reattach-to-user-namespace

brew_cask:
	brew cask install \
		alfred \
		atom \
		the-unarchiver \
		spotify \
		google-chrome \
		slack \

# development

docker_build:
	docker build --tag=$(CONTAINER_NAME) .

docker_restart:
	docker container restart $(CONTAINER_NAME)

docker_run:
	docker run --rm -it -v $(PWD):/home/tester/dotfiles $(CONTAINER_NAME)
