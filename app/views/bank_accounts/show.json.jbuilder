json.extract! @bank_account, :id, :bank_id, :agency, :nick, :account,
              :agreement, :instruction1, :instruction2, :instruction3, :instruction4, :instruction5, :instruction6, :instruction7
json.bank @bank_account.bank.full_name
