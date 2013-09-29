name              "laravel"
maintainer        "Mathias Hansen"
maintainer_email  "me@codemonkey.io"
description       "Main entry point for installing and configuring a Laravel 4 stack"
version           "1.0.0"

recipe "laravel", "Main entry point for installing and configuring a Laravel 4 stack"

depends "apache"
depends "dotdeb"
depends "php"
depends "apt"
depends "openssl"
depends "mysql"

%w{ debian ubuntu }.each do |os|
  supports os
end
