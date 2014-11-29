# ruby encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# ------------ FOR PLANS
Plan.create(name: 'Plus', price: 70, clause: true, clause2: true, clause3: true, clause4: true, selected: false,
         description: 'Este é um plano completo, com tudo o que você tem direito, geo localização, boletos... Tudo!',
         full_description: '')

Plan.create(name: 'Gratuito', price: 0, clause: true, clause2: true, clause3: false, clause4: false, selected: true,
         description: 'Por 45 dias você tem acesso completo, após esse tempo seu plano é reduzido a apenas as funcionalidades a baixo.',
         full_description: '')

Plan.create(name: 'Embaixador', price: 30, clause: true, clause2: true, clause3: true, clause4: true, selected: false,
         description: 'Utilize todas as vantagens do plano <b>Plus</b>, só que mais barato! Como? Ao indicar 3 ou mais vanzeiros você já consegue o benefício!',
         full_description: '')

# ------------ END FOR PLANS

# ------------ FOR BANKS
Bank.create(full_name: 'Caixa Econômica Federal', name: :caixa)
Bank.create(full_name: 'Banco do Brasil', name: :bb)
# ------------ END FOR BANKS