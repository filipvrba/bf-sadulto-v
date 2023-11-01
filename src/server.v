module main

import vweb
import os

const(
	port = 8080
	bf_products_uri = os.getenv("BF_PRODUCTS_URI")
)

pub struct Server {
  vweb.Context
}

pub fn server_init() {
  vweb.run_at(new_server(), vweb.RunParams{
        port: port
    }) or { panic(err) }
}

fn new_server() &Server {
  mut server := &Server{}
  return server
}

pub fn (mut s Server) before_request() {
	s.add_header("Access-Control-Allow-Origin", "*")
	s.add_header("Access-Control-Allow-Methods", "GET")
}
