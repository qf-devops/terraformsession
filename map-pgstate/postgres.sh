Postgres db:
  docker run --name db -h db -e POSTGRES_PASSWORD=postgres -itd postgres

client: 
docker run -it --rm --link db postgres psql -h db -U postgres

# create database terraform_backend

# \dt terraform_remote_state.*

# \d terraform_remote_state.states

# SELECT * FROM terraform_remote_state.states
