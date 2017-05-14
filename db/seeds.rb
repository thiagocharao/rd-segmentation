Contact.create(name: 'Adam Baum', email: 'adam_baum@google.com', age: 18, state: 'RS', role: 'Manager')
Contact.create(name: 'Adam Zapel', email: 'adam_zapel@google.com', age: 20, state: 'SC', role: 'Software Developer')
Contact.create(name: 'Al Bino', email: 'al_bino@google.com', age: 18, state: 'RJ', role: 'Software Engineer')
Contact.create(name: 'Al Dente', email: 'al_dente@google.com', age: 18, state: 'BA', role: 'Product Owner')
Contact.create(name: 'Al Fresco', email: 'al_fresco@google.com', age: 18, state: 'RO', role: 'QA')
Contact.create(name: 'Al K. Seltzer', email: 'al_k_seltzer@google.com', age: 26, state: 'RS', role: 'QA')
Contact.create(name: 'Alf A. Romeo', email: 'alf_a_romeo@google.com', age: 24, state: 'RS', role: 'QA')
Contact.create(name: 'Ali Gaither', email: 'ali_gaither@google.com', age: 22, state: 'RS', role: 'QA')
Contact.create(name: 'Amber Green', email: 'amber_green@google.com', age: 22, state: 'RS', role: 'QA')
Contact.create(name: 'Anna Conda', email: 'anna_conda@google.com', age: 20, state: 'SC', role: 'Software Developer')
Contact.create(name: 'Anna Graham', email: 'anna_graham@google.com', age: 22, state: 'SC', role: 'Software Engineer')
Contact.create(name: 'Anna Sasin', email: 'anna_sasin@google.com', age: 20, state: 'SC', role: 'Product Owner')
Contact.create(name: 'Anne Teak', email: 'anne_teak@google.com', age: 18, state: 'SC', role: 'Software Engineer')
Contact.create(name: 'Annette Curtain', email: 'annette_curtain@google.com', age: 30, state: 'SC', role: 'Manager')
Contact.create(name: 'Annie Howe', email: 'annie_howe@google.com', age: 48, state: 'SC', role: 'Software Developer')
Contact.create(name: 'Aretha Holly', email: 'aretha_holly@google.com', age: 24, state: 'SC', role: 'Software Engineer')
Contact.create(name: 'Armand Hammer', email: 'armand_hammer@google.com', age: 26, state: 'SC', role: 'Product Owner')
Contact.create(name: 'B.A. Ware', email: 'ba_ware@google.com', age: 18, state: 'SC', role: 'Software Engineer')
Contact.create(name: 'Barb Dwyer', email: 'barb_dwyer@google.com', age: 20, state: 'SP', role: 'Manager')
Contact.create(name: 'Barb E. Dahl', email: 'barb_e_dahl@google.com', age: 24, state: 'SP', role: 'QA')
Contact.create(name: 'Barbara Seville', email: 'barbara_seville@google.com', age: 30, state: 'SP', role: 'Software Developer')
Contact.create(name: 'Barry Cade', email: 'barry_cade@google.com', age: 20, state: 'SP', role: 'QA')
Contact.create(name: 'Bea Minor and Dee Major', email: 'bea_minor_and_dee_major@google.com', age: 46, state: 'SP', role: 'Software Engineer')
Contact.create(name: 'Biff Wellington', email: 'biff_wellington@google.com', age: 30, state: 'SP', role: 'Product Owner')
Contact.create(name: 'Bill Board', email: 'bill_board@google.com', age: 20, state: 'SP', role: 'Software Engineer')
Contact.create(name: 'Bill Ding', email: 'bill_ding@google.com', age: 18, state: 'SP', role: 'Software Developer')
Contact.create(name: 'Bill Foldes', email: 'bill_foldes@google.com', age: 22, state: 'PI', role: 'Software Engineer')
Contact.create(name: 'Bill Loney', email: 'bill_loney@google.com', age: 20, state: 'PI', role: 'QA')
Contact.create(name: 'Billy Rubin', email: 'billy_rubin@google.com', age: 22, state: 'PI', role: 'Manager')
Contact.create(name: 'Bob Apple', email: 'bob_apple@google.com', age: 18, state: 'PI', role: 'QA')
Contact.create(name: 'Bonnie Ann Clyde', email: 'bonnie_ann_clyde@google.com', age: 32, state: 'PI', role: 'Manager')
Contact.create(name: 'Brandy D. Cantor', email: 'brandy_d_cantor@google.com', age: 32, state: 'PI', role: 'Product Owner')
Contact.create(name: 'Brighton Early', email: 'brighton_early@google.com', age: 28, state: 'PI', role: 'Software Engineer')
Contact.create(name: 'Brock Lee', email: 'brock_lee@google.com', age: 18, state: 'RS', role: 'QA')
Contact.create(name: 'Brooke Trout', email: 'brooke_trout@google.com', age: 24, state: 'RS', role: 'CEO')


ContactSegmentation.create(description: 'Managers named Bill',
                           filter_conditions_attributes: [
                               {"mandatory": true, "field": "name", "comparator": "start", "value": "Bill"},
                               {"mandatory": true, "field": "role", "comparator": "eq", "value": "Manager"},
                               {"mandatory": true, "field": "age", "comparator": "gt", "value": "18"}
                           ])
ContactSegmentation.create(description: 'Older than 30',
                           filter_conditions_attributes: [
                               {"mandatory": true, "field": "age", "comparator": "gt", "value": "30"}
                           ])
ContactSegmentation.create(description: 'Yahoo  email users',
                           filter_conditions_attributes: [
                               {"mandatory": true, "field": "email", "comparator": "end", "value": "yahoo.com"}
                           ])
ContactSegmentation.create(description: 'QAs in RS and SC',
                           filter_conditions_attributes: [
                               {"mandatory": true, "field": "state", "comparator": "eq", "value": "RS"},
                               {"mandatory": false, "field": "state", "comparator": "eq", "value": "SC"}
                           ])
