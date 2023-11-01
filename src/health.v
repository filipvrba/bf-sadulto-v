module main

pub struct Health {
  status_code int
  status string
}

const(
	healts = {
    200: Health{ 200, "OK" }
    201: Health{ 201, "Created" }
    401: Health{ status_code: 401, status: "Unauthorized" }
    403: Health{ status_code: 403, status: "Forbidden" }
    405: Health{ status_code: 405, status: "Method Not Allowed" }
  }
)
