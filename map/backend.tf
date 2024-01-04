terraform {
  backend "pg" {
    conn_str = "postgres://postgres:postgres@db/terraform_backend?sslmode=disable"
  }
}
