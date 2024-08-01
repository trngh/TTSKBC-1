# Sử dụng hình ảnh chính thức của Ruby với phiên bản 2.7.1
FROM ruby:2.7.1

# Cài đặt các phụ thuộc hệ thống cần thiết
RUN apt-get update -qq && apt-get install -y \
  curl \
  gnupg \
  default-mysql-client \
  build-essential \
  libpq-dev \
  libxml2-dev \
  libxslt1-dev \
  libcurl4-openssl-dev \
  libffi-dev \
  libsqlite3-dev \
  liblzma-dev \
  # Cài đặt Node.js và npm
  && curl -sL https://deb.nodesource.com/setup_16.x | bash - \
  && apt-get install -y nodejs \
  && npm install -g yarn

# Đặt thư mục làm việc trong container
WORKDIR /TTSKBC

# Sao chép file Gemfile và Gemfile.lock vào container
COPY Gemfile /TTSKBC/Gemfile
COPY Gemfile.lock /TTSKBC/Gemfile.lock

RUN yarn install --check-files

# Cài đặt Bundler phiên bản chính xác
RUN gem install bundler:2.4.22

# Cài đặt các gem đã được liệt kê trong Gemfile
RUN bundle install

# Sao chép toàn bộ dự án vào container
COPY . /TTSKBC

# Chạy các lệnh cần thiết để khởi động ứng dụng
CMD ["rails", "server", "-b", "0.0.0.0"]
