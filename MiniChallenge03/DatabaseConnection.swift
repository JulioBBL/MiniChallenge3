//
//  FirebaseConnection.swift
//  MiniChallenge03
//
//  Created by Ricardo Sousa on 12/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import Foundation
import CloudKit

class DatabaseConnection {
    static let sharedInstance = DatabaseConnection()
    
    var user: User?
    let container: CKContainer
    let publicDB: CKDatabase
    let privateDB: CKDatabase
    
    private init() {
        self.container = CKContainer.default()
        self.publicDB = container.publicCloudDatabase
        self.privateDB = container.privateCloudDatabase
        
        self.user = nil
    }
    
    func usuarioAtual(completion: @escaping (User, Error?) -> Void) {
        if let user = self.user {
            completion(user, nil)
        } else {
            let predicate = NSPredicate(value: true)
            let query = CKQuery(recordType: "UserExtra", predicate: predicate)
            
            self.privateDB.perform(query, inZoneWith: nil, completionHandler: { (records, error) in
                if let record = records?.first {
                    self.user = User(record: record)
                    completion(self.user!, error)
                }
            })
        }
    }
    
    func getHemocentros(completion: @escaping ([Hemocentro]) -> Void) {
        //        let predicate = NSPredicate(value: true)
        //        let query = CKQuery(recordType: "Hemocentro", predicate: predicate)
        //
        //        self.publicDB.perform(query, inZoneWith: nil) { (records, error) in
        //            if error == nil && records != nil && (records?.count)! > 0 {
        //                var hemocentros: [Hemocentro] = []
        //                for record in records! {
        //                    hemocentros.append(Hemocentro(record: record))
        //                }
        //                completion(hemocentros)
        //            }
        //        }
        
        let stuff = [
            Hemocentro(
                nome: "Hemocentro de Alegrete",
                estado: "Rio Grande do Sul",
                cidade: "Alegrete",
                bairro: "Canudos",
                endereco: "Rua General Sampaio 10",
                cep: "97541-110",
                latitude:"-29.775973",
                longitude:"-55.791104",
                telefone: "55 3426-4127"
            ),
            Hemocentro(
                nome: "Hemocentro de Cruz Alta",
                estado: "Rio Grande do Sul",
                cidade: "Cruz Alta",
                bairro: "Cruz Alta",
                endereco: "Rua Barão do Rio Branco 1445",
                cep: "98005-030",
                latitude:"-28.644479",
                longitude:"-53.607977",
                telefone: "55 3326-3168"
            ),
            Hemocentro(
                nome: "Hemocentro de Palmeira das Missões",
                estado: "Rio Grande do Sul",
                cidade: "Palmeira das Missões",
                bairro: "Centro",
                endereco: "Rua Engenheiro Isaías M. Nassif 503",
                cep: "98300-000",
                latitude:"-27.905319",
                longitude:"-53.317232",
                telefone: "55 3742-5676"
            ),
            Hemocentro(
                nome: "HEMOCS - Hemocentro de Caxias do Sul",
                estado: "Rio Grande do Sul",
                cidade: "Caxias do Sul",
                bairro: "Centro",
                endereco: "Rua Ernesto Alves 2260",
                cep: "95020-360",
                latitude:"-29.164277",
                longitude:"-51.184574",
                telefone: "54 3290-4536"
            ),
            Hemocentro(
                nome: "HEMOPASSO - Hemocentro de Passo Fundo",
                estado: "Rio Grande do Sul",
                cidade: "Passo Fundo",
                bairro: "Centro",
                endereco: "Avenida Sete de Setembro 1055",
                cep: "99010-120",
                latitude:"-28.265403",
                longitude:"-52.403470",
                telefone: "54 3311-5555"
            ),
            Hemocentro(
                nome: "HEMOPEL - Hemocentro de Pelotas",
                estado: "Rio Grande do Sul",
                cidade: "Pelotas",
                bairro: "Centro",
                endereco: "Avenida Bento Gonçalves 4569",
                cep: "96015-140",
                latitude:"-31.758458",
                longitude:"-52.348636",
                telefone: "53 3222-3002"
            ),
            Hemocentro(
                nome: "HEMORGS - Centro de Hemoterapia e Hematologia",
                estado: "Rio Grande do Sul",
                cidade: "Porto Alegre",
                bairro: "Partenon",
                endereco: "Avenida Bento Gonçalves 3.722",
                cep: "90650-000",
                latitude:"-30.062731",
                longitude:"-51.178431",
                telefone: "51 3336-6755"
            ),
            Hemocentro(
                nome: "HEMORGS - Regional de Santa Maria",
                estado: "Rio Grande do Sul",
                cidade: "Santa Maria",
                bairro: "Nossa Senhora de Lourdes",
                endereco: "Rua Alameda Santiago do Chile 35",
                cep: "97050-685",
                latitude:"-29.692650",
                longitude:"-53.794403",
                telefone: "55 3221-5262"
            ),
            Hemocentro(
                nome: "HEMOSAR - Hemocentro de Santa Rosa",
                estado: "Rio Grande do Sul",
                cidade: "Santa Rosa",
                bairro: "Centro",
                endereco: "Rua Boa Vista 401",
                cep: "98900-000",
                latitude:"-27.868399",
                longitude:"-54.486176",
                telefone: "55 3511-7367"
            ),
            Hemocentro(
                nome: "HEMOSC - Centro de Hemoterapia e Hematologia de Santa Catarina",
                estado: "Santa Catarina",
                cidade: "Florianópolis",
                bairro: "Centro",
                endereco: "Avenida Othon Gama D'eça, 756 Praça Dom Pedro I",
                cep: "88015-240",
                latitude:"-27.589241",
                longitude:"-48.551051",
                telefone: "48 32519712"
            ),
            Hemocentro(
                nome: "HEMEPAR - Centro de Hematologia e Hemoterapia do Paraná",
                estado: "Paraná",
                cidade: "Curitiba",
                bairro: "Alto do Quinze",
                endereco: "Trav. João Prosdócimo, 145",
                cep: "80045-145",
                latitude:"-25.425230",
                longitude:"-49.257335",
                telefone: "0800-645-4555"
            ),
            Hemocentro(
                nome: "HEMOSUL - Centro de Hemoterapia e Hematologia do Mato Grosso do Sul",
                estado: "Mato Grosso do Sul",
                cidade: "Campo Grande",
                bairro: "Centro",
                endereco: "Avenida Fernando Correia da Costa, 1304",
                cep: "79004-310",
                latitude:"-20.468680",
                longitude:"-54.609114",
                telefone: "(67) 3312-1517"
            ),
            Hemocentro(
                nome: "Fundação Pró-Sangue Hemocentro de São Paulo - Posto Barueri",
                estado: "São Paulo",
                cidade: "Barueri",
                bairro: "Jardim Barueri",
                endereco: "Rua Angela Mirella 354, Térreo",
                cep: "06411-330",
                latitude:"-23.496850",
                longitude:"-46.872595",
                telefone: "0800-55-0300"
            ),
            Hemocentro(
                nome: "Fundação Pró-Sangue Hemocentro de São Paulo - Posto Clínicas",
                estado: "São Paulo",
                cidade: "São Paulo",
                bairro: "Cerqueira César",
                endereco: "Avenida Enéas Carvalho Aguiar, 155, Primeiro Andar",
                cep: "05303-000",
                latitude:"-23.557841",
                longitude:"-46.668905",
                telefone: "0800-55-0300"
            ),
            Hemocentro(
                nome: "Fundação Pró-Sangue Hemocentro de São Paulo - Posto Dante Pazzanese",
                estado: "São Paulo",
                cidade: "São Paulo",
                bairro: "Ibirapuera",
                endereco: "Avenida Doutor Dante Pazzanese, 500",
                cep: "04012-180",
                latitude:"-23.584919",
                longitude:"-46.652198",
                telefone: "0800-55-0300"
            ),
            Hemocentro(
                nome: "Fundação Pró-Sangue Hemocentro de São Paulo - Posto Mandaqui",
                estado: "São Paulo",
                cidade: "São Paulo",
                bairro: "Mandaqui",
                endereco: "Rua Voluntários da Pátria, 4227",
                cep: "02401-400",
                latitude:"-23.484523",
                longitude:"-46.630255",
                telefone: "0800-55-0300"
            ),
            Hemocentro(
                nome: "Fundação Pró-Sangue Hemocentro de São Paulo - Posto Regional de Osasco",
                estado: "São Paulo",
                cidade: "Osasco",
                bairro: "Presidente Altino",
                endereco: "Rua Ari Barroso, 355",
                cep: "06216-240",
                latitude:"-23.524813",
                longitude:"-46.771516",
                telefone: "0800-55-0300"
            ),
            Hemocentro(
                nome: "Hemocentro de Botucatu",
                estado: "São Paulo",
                cidade: "Botucatu",
                bairro: "Distrito de Rubião Junior",
                endereco: "Unesp - Faculdade de Medicina Campus de Botucatu",
                cep: "18618-687",
                latitude:"-22.889253",
                longitude:"-48.496126",
                telefone: "14 3811-6041"
            ),
            Hemocentro(
                nome: "Hemocentro de São José do Rio Preto",
                estado: "São Paulo",
                cidade: "São José do Rio Preto",
                bairro: "Jardim Panorama",
                endereco: "Avenida Jamil Feres Kfouri, 80",
                cep: "15091-240",
                latitude:"-20.827349",
                longitude:"-49.400311",
                telefone: "17 3201-5151"
            ),
            Hemocentro(
                nome: "Hemocentro Regional de Campinas",
                estado: "São Paulo",
                cidade: "Campinas",
                bairro: "Cidade Universitária",
                endereco: "Rua Carlos Chagas 480",
                cep: "13083-878",
                latitude:"-22.828696",
                longitude:"-47.062441",
                telefone: "0800-722-8432"
            ),
            Hemocentro(
                nome: "Hemocentro Regional De Marília",
                estado: "São Paulo",
                cidade: "Marília",
                bairro: "Fragata",
                endereco: "Rua Lourival Freire, 240",
                cep: "175519-050",
                latitude:"-22.224959",
                longitude:"-49.937966",
                telefone: "14 3402-1850"
            ),
            Hemocentro(
                nome: "Hemocentro Regional de Ribeirão Preto",
                estado: "São Paulo",
                cidade: "Ribeirão Preto",
                bairro: "Monte Alegre",
                endereco: "Rua Tenente Catão Roxo, 2501",
                cep: "14051-140",
                latitude:"-21.161916",
                longitude:"-47.848718",
                telefone: "0800-979-6049"
            ),
            Hemocentro(
                nome: "Hemonúcleo de Araçatuba",
                estado: "São Paulo",
                cidade: "Araçatuba",
                bairro: "Aviação",
                endereco: "Avenida Arthur Ferreira da Costa, 330",
                cep: "16055-605",
                latitude:"-21.192413",
                longitude:"-50.431711",
                telefone: "18 2102-9400"
            ),
            Hemocentro(
                nome: "Hemonúcleo de Araraquara",
                estado: "São Paulo",
                cidade: "Araraquara",
                bairro: "Centro",
                endereco: "Avenida da Saudade, 58",
                cep: "14801-120",
                latitude:"-21.794334",
                longitude:"-48.181579",
                telefone: "16 3301-6102"
            ),
            Hemocentro(
                nome: "Hemonúcleo de Assis",
                estado: "São Paulo",
                cidade: "Assis",
                bairro: "Centro",
                endereco: "Rua Doutor Symphrônio Alves Do Santos",
                cep: "19800-000",
                latitude:"-22.660220",
                longitude:"-50.409970",
                telefone: "18 3302-6023"
            ),
            Hemocentro(
                nome: "Hemonúclo de Barretos",
                estado: "São Paulo",
                cidade: "Barretos",
                bairro: "Dr.Paulo Prata",
                endereco: "Rua Antenor Duarte Villela 1.331",
                cep: "14784-400",
                latitude:"-20.582144",
                longitude:"-48.570394",
                telefone: "17 3321-6600 ramal 6941"
            ),
            Hemocentro(
                nome: "Hemonúcleo de Bauru",
                estado: "São Paulo",
                cidade: "Bauru",
                bairro: "Centro",
                endereco: "Rua Monsenhor Claro, 888",
                cep: "17800-000",
                latitude:"-22.330367",
                longitude:"-49.076826",
                telefone: "14 3234-4412"
            ),
            Hemocentro(
                nome: "Hemonúcleo de Catanduva",
                estado: "São Paulo",
                cidade: "Catanduva",
                bairro: "Centro",
                endereco: "Rua 13 de Maio, 974",
                cep: "15800-010",
                latitude:"-21.140218",
                longitude:"-48.976232",
                telefone: "17 3522-7722"
            ),
            Hemocentro(
                nome: "Hemonúcleo de Hematologia e Hemoterapia de Piracicaba",
                estado: "São Paulo",
                cidade: "Piracicaba",
                bairro: "Cidade Alta",
                endereco: "Avenida Independência, 953",
                cep: "13416-225",
                latitude:"-22.737379",
                longitude:"-47.643499",
                telefone: "19 3422-2019"
            ),
            Hemocentro(
                nome: "Hemonúcleo de Jaú",
                estado: "São Paulo",
                cidade: "Jaú",
                bairro: "Chácara Braz Miraglia",
                endereco: "Rua Dona Silvéria, 150",
                cep: "17210-070",
                latitude:"-22.291511",
                longitude:"-48.550015",
                telefone: "14 3602-1355"
            ),
            Hemocentro(
                nome: "Hemonúcleo de Santos",
                estado: "São Paulo",
                cidade: "Santos",
                bairro: "Boqueirão",
                endereco: "Rua Oswaldo Cruz, 197",
                cep: "11045-904",
                latitude:"-23.963524",
                longitude:"-46.319694",
                telefone: "13 3202-1428"
            ),
            Hemocentro(
                nome: "Hospital Municipal de Americana",
                estado: "São Paulo",
                cidade: "Americana",
                bairro: "Jardim Nossa Senhora de Fátima",
                endereco: "Avenida da Saúde, 415",
                cep: "11045-904",
                latitude:"-23.963524",
                longitude:"-46.319694",
                telefone: "19 3468-1739"
            ),
            Hemocentro(
                nome: "Hospital Municipal de Bebedouro",
                estado: "São Paulo",
                cidade: "Bebedouro",
                bairro: "Jardim Júlia",
                endereco: "Avenida Raul Furquim, 2010",
                cep: "14706-014",
                latitude:"-20.934645",
                longitude:"-48.496506",
                telefone: "17 3342-8817"
            ),
            Hemocentro(
                nome: "Hospital Municipal de Cubatão",
                estado: "São Paulo",
                cidade: "Cubatão",
                bairro: "Vila Santa Rosa",
                endereco: "Avenida Henry Borden",
                cep: "11515-000",
                latitude:"-23.890361",
                longitude:"-46.421028",
                telefone: "13 3362-5400"
            ),
            Hemocentro(
                nome: "Hospital São José Santa Casa de São Vicente",
                estado: "São Paulo",
                cidade: "São Vicente",
                bairro: "Centro",
                endereco: "Rua Frei Gaspar, 790",
                cep: "11310-061",
                latitude:"-23.965214",
                longitude:"-46.386662",
                telefone: "13 3569-6000"
            ),
            Hemocentro(
                nome: "Núcleo de Hemoterapia de Fernandópolis",
                estado: "São Paulo",
                cidade: "Fernandópolis",
                bairro: "Jardim Santista",
                endereco: "Rua Simão São Gomes, 266",
                cep: "15600-000",
                latitude:"-20.294815",
                longitude:"-50.247362",
                telefone: "17 3442-5544"
            ),
            Hemocentro(
                nome: "Núcleo de Hemoterapia de Franca",
                estado: "São Paulo",
                cidade: "Franca",
                bairro: "Jardim Dr. Antônio Petráglia",
                endereco: "Avenida Doutor Hélio Palermo, 4181",
                cep: "1440-045",
                latitude:"-20.519303",
                longitude:"-47.394308",
                telefone: "16 3402-5000"
            ),
            Hemocentro(
                nome: "Núcleo de Hemoterapia de Presidente Prudente",
                estado: "São Paulo",
                cidade: "Presidente Prudente",
                bairro: "Vila Euclides",
                endereco: "Rua Wenceslau Bras, 05",
                cep: "19014-030",
                latitude:"-22.129015",
                longitude:"-51.392085",
                telefone: "18 3223-3511"
            ),
            Hemocentro(
                nome: "Santa Casa de Adamantina",
                estado: "São Paulo",
                cidade: "Adamantina",
                bairro: "Vila Cicma",
                endereco: "Rua Joaquim Luiz Vian, 209",
                cep: "17800-000",
                latitude:"-21.692959",
                longitude:"-51.070897",
                telefone: "18 3502-2200"
            ),
            Hemocentro(
                nome: "Santa Casa de Batatais",
                estado: "São Paulo",
                cidade: "Batatais",
                bairro: "Centro",
                endereco: "Rua Doutor Manoel Furtado, 235",
                cep: "14300-000",
                latitude:"-20.888414",
                longitude:"-47.584184",
                telefone: "16 3761-4004"
            ),
            Hemocentro(
                nome: "Santa Casa de Limeira",
                estado: "São Paulo",
                cidade: "Limeira",
                bairro: "Vila Claudia",
                endereco: "Avenida Antonio Ometto, 675",
                cep: "13480-470",
                latitude:"-22.579130",
                longitude:"-47.400568",
                telefone: "19 3446-6115"
            ),
            Hemocentro(
                nome: "Santa Casa de Lins",
                estado: "São Paulo",
                cidade: "Lins",
                bairro: "Centro",
                endereco: "Rua Nove de Julho",
                cep: "14 3533-2500",
                latitude:"-21.673177",
                longitude:"-49.755622",
                telefone: "14 3533-2500"
            ),
            Hemocentro(
                nome: "Santa Casa de Mogi Das Cruzes",
                estado: "São Paulo",
                cidade: "Mogi das Cruzes",
                bairro: "Centro",
                endereco: "Rua Barão de Jaceguai, 1148",
                cep: "08780-906",
                latitude:"-23.521319",
                longitude:"-46.186987",
                telefone: "11 4799-2892"
            ),
            Hemocentro(
                nome: "Santa Casa de Olímpia",
                estado: "São Paulo",
                cidade: "Olímpia",
                bairro: "Centro",
                endereco: "Rua Síria , 190",
                cep: "15400-000",
                latitude:"-20.736030",
                longitude:"-48.918283",
                telefone: "17 3281-9080"
            ),
            Hemocentro(
                nome: "Santa Casa de São Carlos",
                estado: "São Paulo",
                cidade: "São Carlos",
                bairro: "Vila Pureza",
                endereco: "Rua Paulino Botelho de Abreu Sampaio, 573",
                cep: "13561-060",
                latitude:"-22.011942",
                longitude:"-47.900821",
                telefone: "16 3509-1230"
            ),
            Hemocentro(
                nome: "Unidade do Hemocentro RP Cidade Serrana",
                estado: "São Paulo",
                cidade: "Serrana",
                bairro: "Centro",
                endereco: "Rua Nossa Senhora das Dores, 741",
                cep: "14150-000",
                latitude:"-21.204815",
                longitude:"-47.595722",
                telefone: "16 3987-1626"
            ),
            Hemocentro(
                nome: "HEMORIO - Instituto Estadual de Hematologia Arthur de Siqueira Cavalcanti",
                estado: "Rio de Janeiro",
                cidade: "Rio de Janeiro",
                bairro: "Centro",
                endereco: "Rua Frei Caneca, 08",
                cep: "20211-030",
                latitude:"-22.909064",
                longitude:"-43.189788",
                telefone: "0800-2820708"
            ),
            Hemocentro(
                nome: "HEMOES - Centro de Hemoterapia e Hematologia do Espírito Santo",
                estado: "Espírito Santo",
                cidade: "Vitória",
                bairro: "Maruípe",
                endereco: "Avenida Marechal Campos, 1468",
                cep: "29047-100",
                latitude:"-20.298913",
                longitude:"-40.318890",
                telefone: "27 3137-2434"
            ),
            Hemocentro(
                nome: "HEMOMINAS - Fundação Centro de Hematologia e Hemoterapia de MG",
                estado: "Minas Gerais",
                cidade: "Belo Horizonte",
                bairro: "Santa Efigênia",
                endereco: "Alameda Ezequiel Dias, 321",
                cep: "30130-110",
                latitude:"-19.924672",
                longitude:"-43.931785",
                telefone: "0800-0310101"
            ),
            Hemocentro(
                nome: "Fundação Hemocentro de Brasília",
                estado: "Distrito Federal",
                cidade: "Brasília",
                bairro: "Asa Norte",
                endereco: "SMHN Quadra 03 Conjunto A",
                cep: "70297-400",
                latitude:"-15.785156",
                longitude:"-47.885893",
                telefone: "61 3327-4413"
            ),
            Hemocentro(
                nome: "HEMOG - Centro de Hemoterapia e Hematologia de Goiás",
                estado: "Goiás",
                cidade: "Goiania",
                bairro: "Setor Coimbra",
                endereco: "Avenida Anhanguera, 5195",
                cep: "74535-010",
                latitude:"-16.675781",
                longitude:"-49.279540",
                telefone: "62 3201-4574"
            ),
            Hemocentro(
                nome: "HEMOMAT - Centro de Hemoterapia e Hematologia de Mato Grosso",
                estado: "Mato Grosso",
                cidade: "Cuiabá",
                bairro: "Centro",
                endereco: "Rua 13 de Junho, 1055",
                cep: "78005-100",
                latitude:"-15.605456",
                longitude:"-56.101361",
                telefone: "65 3321-4578"
            ),
            Hemocentro(
                nome: "HEMERON - Centro de Hematologia e Hemoterapia de Rondônia",
                estado: "Rondônia",
                cidade: "Porto Velho",
                bairro: "Industrial",
                endereco: "Avenida Governador Jorge Teixeira, 3766",
                cep: "78905-160",
                latitude:"-8.737187",
                longitude:"-63.890100",
                telefone: "69 3216-5489"
            ),
            Hemocentro(
                nome: "HEMOACRE - Centro de Hemoterapia e Hematologia do Acre",
                estado: "Acre",
                cidade: "Rio Branco",
                bairro: "Vila Ivonete",
                endereco: "Avenida Getúlio Vargas, 2787",
                cep: "69900-607",
                latitude:"-9.953830",
                longitude:"-67.818893",
                telefone: "68 3248-1380"
            ),
            Hemocentro(
                nome: "HEMOAM - Centro de Hemoterapia e Hematologia do Amazonas",
                estado: "Amazonas",
                cidade: "Manaus",
                bairro: "Chapada",
                endereco: "Avenida Constantino Nery, 3240",
                cep: "69050-002",
                latitude:"-3.086342",
                longitude:"-60.027006",
                telefone: "0800-2850220"
            ),
            Hemocentro(
                nome: "HEMORAIMA - Centro de Hemoterapia e Hematologia de Roraima",
                estado: "Roraima",
                cidade: "Boa Vista",
                bairro: "Mecejana",
                endereco: "Avenida Brigadeiro Eduardo Gomes",
                cep: "69304-500",
                latitude:"2.831871",
                longitude:"-60.690016",
                telefone: "92 2121-0883"
            ),
            Hemocentro(
                nome: "HEMOPA - Centro de Hemoterapia e Hematologia do Pará",
                estado: "Pará",
                cidade: "Belém",
                bairro: "Batista Campos",
                endereco: "Travessa Padre Eutiquio, 2109",
                cep: "66033-000",
                latitude:"-1.462757",
                longitude:"-48.487295",
                telefone: "0800-2808118"
            ),
            Hemocentro(
                nome: "HEMOAP - Centro de Hemoterapia e Hematologia do Amapá",
                estado: "Amapá",
                cidade: "Macapá",
                bairro: "Jesus de Nazaré",
                endereco: "Av. Raimundo Álvares da Costa",
                cep: "68900-074",
                latitude:"0.042708",
                longitude:"-51.059813",
                telefone: "96 3212-6139"
            ),
            Hemocentro(
                nome: "HEMOTO - Centro de Hemoterapia e Hematologia de Tocantins",
                estado: "Tocantins",
                cidade: "Palmas",
                bairro: "Lt. 1, Centro",
                endereco: "Avenida NS 1, s/n ",
                cep: "77001-214",
                latitude:"-10.166135",
                longitude:"-48.332052",
                telefone: "63 3218-3285 / 3287"
            ),
            Hemocentro(
                nome: "HEMOBA - Centro de Hematologia e Hemoterapia da Bahia",
                estado: "Bahia",
                cidade: "Salvador",
                bairro: "Brotas",
                endereco: "Ladeira do Hospital Geral, S/N",
                cep: "40286-240",
                latitude:"-12.996273",
                longitude:"-38.489835",
                telefone: "71 3116-5664"
            ),
            Hemocentro(
                nome: "HEMOMAR - Centro de Hematologia e Hemoterapia do Maranhão",
                estado: "Maranhão",
                cidade: "São Luis",
                bairro: "Barreto",
                endereco: "Rua 5 de Janeiro, S/N",
                cep: "65040-450",
                latitude:"-2.543599",
                longitude:"-44.265376",
                telefone: "0800-2806565"
            ),
            Hemocentro(
                nome: "HEMOPI - Centro de Hematologia e Hemoterapia do Piauí",
                estado: "Piauí",
                cidade: "Teresina",
                bairro: "Centro",
                endereco: "Rua 1º de Maio, 235",
                cep: "64001-430",
                latitude:"-5.089479",
                longitude:"-42.803932",
                telefone: "64001-430"
            ),
            Hemocentro(
                nome: "HEMOCE - Centro de Hematologia e Hemoterapia do Ceará",
                estado: "Ceará",
                cidade: "Fortaleza",
                bairro: "Rodolfo Teófilo",
                endereco: "Avenida José Bastos, 3.390",
                cep: "60431-086",
                latitude:"-3.748970",
                longitude:"-38.549971",
                telefone: "0800-2862296"
            ),
            Hemocentro(
                nome: "HEMOSE - Centro de Hematologia e Hemoterapia de Sergipe",
                estado: "Sergipe",
                cidade: "Aracajú",
                bairro: "Capuxo",
                endereco: "Avenida Tancredo Neves, S/N",
                cep: "49095-000",
                latitude:"-10.913756",
                longitude:"-37.091626",
                telefone: "79 3259-3174"
            ),
            Hemocentro(
                nome: "HEMOAL - Centro de Hematologia e Hemoterapia de Alagoas",
                estado: "Alagoas",
                cidade: "Maceió",
                bairro: "Trapiche da Barra",
                endereco: "Av. Jorge de Lima, 58",
                cep: "57010-300",
                latitude:"-9.672706",
                longitude:"-35.758612",
                telefone: "82 3315-2106"
            ),
            Hemocentro(
                nome: "HEMOPE - Centro de Hematologia de Pernambuco",
                estado: "Pernambuco",
                cidade: "Recife",
                bairro: "Graças",
                endereco: "Rua Joaquim Nabuco, 171",
                cep: "52011-000",
                latitude:"-8.052737",
                longitude:"-34.897955",
                telefone: "0800-0811535"
            ),
            Hemocentro(
                nome: "HEMONORTE - Centro de Hematologia e Hemoterapia do Rio Grande do Norte",
                estado: "Rio Grande do Norte",
                cidade: "Natal",
                bairro: "Tirol",
                endereco: "Av. Adm. Alexandrino de Alencar, s/nº",
                cep: "59015-350",
                latitude:"-5.810459",
                longitude:"-35.196604",
                telefone: "84 3232-6736"
            ),
            Hemocentro(
                nome: "HEMOÍBA - Centro de Hematologia e Hemoterapia da Paraíba",
                estado: "Paraíba",
                cidade: "João Pessoa",
                bairro: "Torre",
                endereco: "Avenida Dom Pedro II, 1119",
                cep: " 58013-420",
                latitude:"-7.127548",
                longitude:"-34.870620",
                telefone: "83 3218-7601"
            )
        ]
        
        completion(stuff)
    }
    
    func getDonations(completion: @escaping ([Donation]) -> Void) {
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Donation", predicate: predicate)
        
        self.privateDB.perform(query, inZoneWith: nil) { (records, error) in
            var doacoes: [Donation] = []
            
            if error == nil  && records != nil && (records?.count)! > 0 {
                for record in records! {
                    doacoes.append(Donation(record: record))
                }
            }
            completion(doacoes)
        }
    }
    
    func save(donation record: Donation, completion: @escaping (Error?) -> Void) {
        self.privateDB.save(record.toCKRecord()) { (record, error) in
            print("foi fião")
            completion(error)
        }
    }
    
    func save(user: User, completion: @escaping (Error?) -> Void) {
        self.privateDB.save(user.toCKRecord()) { (record, error) in
            print("foi o cracudo")
            completion(error)
        }
    }
}
