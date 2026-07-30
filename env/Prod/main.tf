module "prod" {
  source = "../../infra"
  nome_repositorio = "producao"
  cluster-name =  "producao"
}


output "endereco" {
  value = module.prod.URL
}