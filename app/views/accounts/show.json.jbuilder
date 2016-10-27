# frozen_string_literal: true
json.extract! @account, :id, :bank_id, :agency, :nick, :account,
              :agreement, :instruction1, :instruction2, :instruction3, :instruction4, :instruction5, :instruction6, :instruction7
json.bank @account.bank.full_name
