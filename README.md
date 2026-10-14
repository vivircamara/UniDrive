#  UniDrive - Caronas Universitárias

O **UniDrive** é uma plataforma de caronas universitárias voltada para conectar estudantes que realizam trajetos semelhantes no dia a dia acadêmico. O objetivo principal é oferecer uma solução acessível, segura e justa para a divisão de custos de viagem entre motoristas e passageiros, fomentando a sustentabilidade e a integração na comunidade acadêmica.

##  Lógica de Precificação e Divisão de Custos
A precificação do UniDrive não visa ao lucro comercial, mas sim à recomposição justa dos gastos envolvidos no deslocamento. O cálculo é baseado em dois pilares:
* **Combustível:** Distância da rota (km) ÷ Consumo (km/L) × Preço do Litro.
* **Desgaste/Manutenção:** Distância total rodada (km) × Taxa de Depreciação (R\$ 0,20 / km).

###  Fórmula da Divisão
O custo total da viagem (Combustível + Desgaste) é dividido igualmente entre todos os ocupantes do veículo (motorista e passageiros). Como o motorista também ocupa o veículo, ele arca com sua fração do custo, enquanto o valor acumulado do desgaste vindo dos passageiros ajuda a cobrir a manutenção preventiva do automóvel.

---

## Estrutura de Tecnologia

### Backend & Banco de Dados (Supabase)
O projeto utiliza o **Supabase** como BaaS (Backend as a Service), gerenciando:
- [x] Infraestrutura provisionada na nuvem
- [x] Repositório conectado para integração contínua (CI/CD)
- [ ] Banco de dados relacional PostgreSQL (Tabelas de Usuários, Caronas, Veículos)
- [ ] Autenticação de estudantes
- [ ] Segurança de dados via Row Level Security (RLS)

### Frontend (Flutter)
- [x] Telas iniciais e prototipação em andamento
- [x] Criação do arquivo de inicialização do SDK (`supabase_config.dart`)

---

##  Próximos Passos do Desenvolvimento
* **Modelagem do Banco de Dados:** Criação das tabelas de usuários, veículos e caronas no Supabase.
* **Integração de Geolocalização:** Implementação de APIs de mapas para cálculo automatizado de distâncias.

* Desenvolvido em conjunto por Fernanda Borges, Leticia Pires, Nelson Neto e Viviane Câmara para a disciplina de Projeto Aplicado III.
* **Módulo de Perfil Veicular:** Cadastro de veículos com dados reais de consumo (km/L).
* **Sistema de Pagamentos:** Integração de meios de transferência instantânea para liquidação das divisões de custo.
