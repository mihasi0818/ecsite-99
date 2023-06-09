FROM ruby:3.1.4

# 必要なパッケージのインストールここ一番苦戦した
RUN apt-get update && apt-get install -y \
    build-essential \
    nodejs \
    vim

WORKDIR /app

# GemfileとGemfile.lockをコピーしてbundle installを実行
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

# Railsサーバーの起動コマンドを設定
CMD ["rails", "server", "-b", "0.0.0.0"]
