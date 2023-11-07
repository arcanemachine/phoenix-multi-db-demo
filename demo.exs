alias MultiDbDemo.Repo.V1, as: RepoV1
alias MultiDbDemo.Repo.V2, as: RepoV2
alias MultiDbDemo.V1.Persons.Person, as: PersonV1
alias MultiDbDemo.V2.Persons.Person, as: PersonV2

IO.puts("\n*** Showing example data from the v1 database... ***\n")
IO.inspect(RepoV1.all(PersonV1))

IO.puts("\n*** Showing example data from the v2 database... ***\n")
IO.inspect(RepoV2.all(PersonV2))
