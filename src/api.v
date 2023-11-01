module main

import vweb
import net.http

pub fn (mut s Server) health() vweb.Result {
  return s.json(healts[200])
}

[get; "/api/v1/products"]
pub fn (mut s Server) get_products() vweb.Result {
	result := http.get_text(bf_products_uri)
	return s.text(result)
}
