FROM lululau/manjaro-base

WORKDIR /root

COPY resources/.lnav /root/.lnav
COPY resources/.httpie /root/.httpie
COPY resources/.fzf /root/.fzf
COPY resources/.fzf.zsh /root/
COPY resources/.oh-my-zsh /root/.oh-my-zsh
COPY resources/.spacezsh /root/.spacezsh
COPY resources/.tmux.conf /root/
COPY resources/.vim /root/.vim
COPY resources/.viminfo /root/
COPY resources/.vimrc /root/
COPY resources/.zcompdump /root/
COPY resources/.zlogin /root/
COPY resources/.zprofile /root/
COPY resources/.zsh-aliases.zsh /root/
COPY resources/.zshenv /root/
COPY resources/.zshrc /root/
COPY resources/.gemrc /root/
COPY resources/install-starship.sh /root/
COPY resources/lnav /usr/bin/
COPY resources/tcping /usr/bin/
COPY resources/gron /usr/bin/
COPY --from=hengyunabc/arthas:3.4.4-no-jdk /opt/arthas /opt/arthas
COPY resources/as.sh /usr/bin/

RUN pacman-mirrors -c China \
  && pacman -Sy \
  && pacman --noconfirm -S zsh vim fd \
      base-devel git lsof wget iputils tmux httpie the_silver_searcher  \
      neofetch net-tools mitmproxy ipython redis bind-tools bat lftp \
      jq yq hq  mariadb-clients tree gnu-netcat strace traceroute \
      nload percona-toolkit rclone tcpdump \
      maven nodejs-lts-fermium htop inetutils wireshark-cli \
      ruby python python-pip jdk11-openjdk \
  && ln -nfs /root/.spacezsh/.space.zsh /root/.space.zsh \
  && bash /root/install-starship.sh -y && rm /root/install-starship.sh \
  && gem install rails mysql2 arql prize sqlcomposer rexe \
  && pip install visidata codemod

CMD ["/usr/bin/zsh"]
