FROM selenium/node-chrome-debug:3.141.59

RUN sudo apt update \
 && sudo apt install -y locales tzdata language-pack-ja-base language-pack-ja fonts-noto-cjk \
 && sudo apt clean && sudo apt autoclean \
 && sudo rm -rf /var/lib/apt/lists/*

RUN sudo locale-gen ja_JP.UTF-8 \
 && sudo localedef -f UTF-8 -i ja_JP ja_JP.UTF-8 \
 && sudo update-locale LANG=ja_JP.UTF-8 \
 && sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN mkdir -p /var/tmp/Profile && chmod 777 /var/tmp/Profile

## ECS Fargate entrypoint
# COPY ecs_entry_point.sh /ecs_entry_point.sh
