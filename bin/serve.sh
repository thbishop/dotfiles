#!/bin/bash

function serve() {
  `ruby -run -e httpd -- -p 5000 .`
}
