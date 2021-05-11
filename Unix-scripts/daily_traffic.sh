#
#
#!/bin/bash -l
##
mkdir prod
mkdir nft
cd prod
mkdir wi01
mkdir wi02
mkdir wa01
mkdir wa02
cd ..
cd nft
mkdir wi01
mkdir wi02

cd ..

scp bhatpre@stajprprwi01.prod.pub:/var/log/httpd/*."$(date -d "-1 day" +20%y-%m-%d)-*" /home/cruiseprod/Traffic_Distribution/prod/wi01/
scp bhatpre@stajprprwi02.prod.pub:/var/log/httpd/*."$(date -d "-1 day" +20%y-%m-%d)-*" /home/cruiseprod/Traffic_Distribution/prod/wi02/
scp bhatpre@stajprprwa01:/var/log/httpd/*."$(date -d "-1 day" +20%y-%m-%d)-*" /home/cruiseprod/Traffic_Distribution/prod/wa01/
scp bhatpre@stajprprwa02:/var/log/httpd/*."$(date -d "-1 day" +20%y-%m-%d)-*" /home/cruiseprod/Traffic_Distribution/prod/wa02/
scp bhatpre@stajprnfwi01.dev.pub:/var/log/httpd/*."$(date -d "-1 day" +20%y-%m-%d)-*" /home/cruiseprod/Traffic_Distribution/nft/wi01/
scp bhatpre@stajprnfwi02.dev.pub:/var/log/httpd/*."$(date -d "-1 day" +20%y-%m-%d)-*" /home/cruiseprod/Traffic_Distribution/nft/wi02/

cd prod/wi01/

AMBBY1=$(less access-log*-AM* | grep "quote-process" | wc -l)
AMPOL1=$(less access-log*-AM* | grep "providers-online" | wc -l)
AMAOL1=$(less access-log*-AM* | grep "accessonline" | wc -l)
AMINT1=$(less access-log*-AM* | grep "intercom" | wc -l)
AMSME1=$(less access-log*-AM* | grep "quick-quote" | wc -l)
AMWELLNESS1=$(less access-log*-AM* | grep "bupa.co.uk/wellnessprogramme" | wc -l)
AMPPHQINTER1=$(less access-log*-AM* | grep "wellness.bupa.co.uk/pphq" | wc -l)
AMOCCHEA1=$(less access-log*-AM* | grep "wellness.bupa.co.uk/occhealth" | wc -l)
AMMYBUPA1=$(less access-log*-AM* | grep "members/mybupa-login" | wc -l)
AMHEALTHINSU1=$(less access-log*-AM* | grep "individuals/health-insurance" | wc -l)
AMHEALTHASSES1=$(less access-log*-AM* | grep "individuals/health-assessments" | wc -l)
AMSELFPAY1=$(less access-log*-AM* | grep "individuals/self-pay-treatments" | wc -l)
AMINTERMEDIARY1=$(less access-log*-AM* | grep "bupa.co.uk/intermediaries" | wc -l)
AMDENTAL1=$(less access-log*-AM* | grep "bupa.co.uk/dental" | wc -l)
AMHEALTHINFO1=$(less access-log*-AM* | grep "bupa.co.uk/health-information" | wc -l)
AMCARESERVICE1=$(less access-log*-AM* | grep "bupa.co.uk/care-services" | wc -l)
AMBUSINES1=$(less access-log*-AM* | grep "bupa.co.uk/business" | wc -l)
AMMPA1=$(less access-log*-AM* | grep "bupa.co.uk/mpa" | wc -l)
AMINTLSUC1=$(less access-log*-AM* | grep " 200 " | grep "bupa-intl" | wc -l)
AMINTLPER1=$(less access-log*-AM* | grep " 301 " | grep "bupa-intl" | wc -l)
AMINTLTEM1=$(less access-log*-AM* | grep " 302 " | grep "bupa-intl" | wc -l)
AMINTEREMAIL1=$(less access-log*-AM* | grep "email-collection" | wc -l)

PMBBY1=$(less access-log*-PM* | grep "quote-process" | wc -l)
PMPOL1=$(less access-log*-PM* | grep "providers-online" | wc -l)
PMAOL1=$(less access-log*-PM* | grep "accessonline" | wc -l)
PMINT1=$(less access-log*-PM* | grep "intercom" | wc -l)
PMSME1=$(less access-log*-AM* | grep "quick-quote" | wc -l)
PMWELLNESS1=$(less access-log*-PM* | grep "bupa.co.uk/wellnessprogramme" | wc -l)
PMPPHQINTER1=$(less access-log*-PM* | grep "wellness.bupa.co.uk/pphq" | wc -l)
PMOCCHEA1=$(less access-log*-PM* | grep "wellness.bupa.co.uk/occhealth" | wc -l)
PMMYBUPA1=$(less access-log*-PM* | grep "members/mybupa-login" | wc -l)
PMHEALTHINSU1=$(less access-log*-PM* | grep "individuals/health-insurance" | wc -l)
PMHEALTHASSES1=$(less access-log*-PM* | grep "individuals/health-assessments" | wc -l)
PMSELFPAY1=$(less access-log*-PM* | grep "individuals/self-pay-treatments" | wc -l)
PMINTERMEDIARY1=$(less access-log*-PM* | grep "bupa.co.uk/intermediaries" | wc -l)
PMDENTAL1=$(less access-log*-PM* | grep "bupa.co.uk/dental" | wc -l)
PMHEALTHINFO1=$(less access-log*-PM* | grep "bupa.co.uk/health-information" | wc -l)
PMCARESERVICE1=$(less access-log*-PM* | grep "bupa.co.uk/care-services" | wc -l)
PMBUSINES1=$(less access-log*-PM* | grep "bupa.co.uk/business" | wc -l)
PMMPA1=$(less access-log*-AM* | grep "bupa.co.uk/mpa" | wc -l)
PMINTLSUC1=$(less access-log*-PM* | grep " 200 " | grep "bupa-intl" | wc -l)
PMINTLPER1=$(less access-log*-PM* | grep " 301 " | grep "bupa-intl" | wc -l)
PMINTLTEM1=$(less access-log*-PM* | grep " 302 " | grep "bupa-intl" | wc -l)
PMINTEREMAIL1=$(less access-log*-PM* | grep "email-collection" | wc -l)

AMCONNECTPOL1=$(less error-log*-AM* | grep "Connection reset by peer" | grep "provider-login" | wc -l)
PMCONNECTPOL1=$(less error-log*-PM* | grep "Connection reset by peer" | grep "provider-login" | wc -l)
AMCONNECTAOL1=$(less error-log*-AM* | grep "Connection reset by peer" | grep "accessonline" | wc -l)
PMCONNECTAOL1=$(less error-log*-PM* | grep "Connection reset by peer" | grep "accessonline" | wc -l)
AMCONNECTINT1=$(less error-log*-AM* | grep "Connection reset by peer" | grep "intercom" | wc -l)
PMCONNECTINT1=$(less error-log*-PM* | grep "Connection reset by peer" | grep "intercom" | wc -l)

cd /home/cruiseprod/Traffic_Distribution/prod/wi02/

AMBBY2=$(less access-log*-AM* | grep "quote-process" | wc -l)
AMPOL2=$(less access-log*-AM* | grep "providers-online" | wc -l)
AMAOL2=$(less access-log*-AM* | grep "accessonline" | wc -l)
AMINT2=$(less access-log*-AM* | grep "intercom" | wc -l)
AMSME2=$(less access-log*-AM* | grep "quick-quote" | wc -l)
AMWELLNESS2=$(less access-log*-AM* | grep "bupa.co.uk/wellnessprogramme" | wc -l)
AMPPHQINTER2=$(less access-log*-AM* | grep "wellness.bupa.co.uk/pphq" | wc -l)
AMOCCHEA2=$(less access-log*-AM* | grep "wellness.bupa.co.uk/occhealth" | wc -l)
AMMYBUPA2=$(less access-log*-AM* | grep "members/mybupa-login" | wc -l)
AMHEALTHINSU2=$(less access-log*-AM* | grep "individuals/health-insurance" | wc -l)
AMHEALTHASSES2=$(less access-log*-AM* | grep "individuals/health-assessments" | wc -l)
AMSELFPAY2=$(less access-log*-AM* | grep "individuals/self-pay-treatments" | wc -l)
AMINTERMEDIARY2=$(less access-log*-AM* | grep "bupa.co.uk/intermediaries" | wc -l)
AMDENTAL2=$(less access-log*-AM* | grep "bupa.co.uk/dental" | wc -l)
AMHEALTHINFO2=$(less access-log*-AM* | grep "bupa.co.uk/health-information" | wc -l)
AMCARESERVICE2=$(less access-log*-AM* | grep "bupa.co.uk/care-services" | wc -l)
AMBUSINES2=$(less access-log*-AM* | grep "bupa.co.uk/business" | wc -l)
AMMPA2=$(less access-log*-AM* | grep "bupa.co.uk/mpa" | wc -l)
AMINTLSUC2=$(less access-log*-AM* | grep " 200 " | grep "bupa-intl" | wc -l)
AMINTLPER2=$(less access-log*-AM* | grep " 301 " | grep "bupa-intl" | wc -l)
AMINTLTEM2=$(less access-log*-AM* | grep " 302 " | grep "bupa-intl" | wc -l)
AMINTEREMAIL2=$(less access-log*-AM* | grep "email-collection" | wc -l)

PMBBY2=$(less access-log*-PM* | grep "quote-process" | wc -l)
PMPOL2=$(less access-log*-PM* | grep "providers-online" | wc -l)
PMAOL2=$(less access-log*-PM* | grep "accessonline" | wc -l)
PMINT2=$(less access-log*-PM* | grep "intercom" | wc -l)
PMSME2=$(less access-log*-PM* | grep "quick-quote" | wc -l)
PMWELLNESS2=$(less access-log*-PM* | grep "bupa.co.uk/wellnessprogramme" | wc -l)
PMPPHQINTER2=$(less access-log*-PM* | grep "wellness.bupa.co.uk/pphq" | wc -l)
PMOCCHEA2=$(less access-log*-PM* | grep "wellness.bupa.co.uk/occhealth" | wc -l)
PMMYBUPA2=$(less access-log*-PM* | grep "members/mybupa-login" | wc -l)
PMHEALTHINSU2=$(less access-log*-PM* | grep "individuals/health-insurance" | wc -l)
PMHEALTHASSES2=$(less access-log*-PM* | grep "individuals/health-assessments" | wc -l)
PMSELFPAY2=$(less access-log*-PM* | grep "individuals/self-pay-treatments" | wc -l)
PMINTERMEDIARY2=$(less access-log*-PM* | grep "bupa.co.uk/intermediaries" | wc -l)
PMDENTAL2=$(less access-log*-PM* | grep "bupa.co.uk/dental" | wc -l)
PMHEALTHINFO2=$(less access-log*-PM* | grep "bupa.co.uk/health-information" | wc -l)
PMCARESERVICE2=$(less access-log*-PM* | grep "bupa.co.uk/care-services" | wc -l)
PMBUSINES2=$(less access-log*-PM* | grep "bupa.co.uk/business" | wc -l)
PMMPA2=$(less access-log*-PM* | grep "bupa.co.uk/mpa" | wc -l)
PMINTLSUC2=$(less access-log*-PM* | grep " 200 " | grep "bupa-intl" | wc -l)
PMINTLPER2=$(less access-log*-PM* | grep " 301 " | grep "bupa-intl" | wc -l)
PMINTLTEM2=$(less access-log*-PM* | grep " 302 " | grep "bupa-intl" | wc -l)
PMINTEREMAIL2=$(less access-log*-PM* | grep "email-collection" | wc -l)

AMCONNECTPOL2=$(less error-log*-AM* | grep "Connection reset by peer" | grep "provider-login" | wc -l)
PMCONNECTPOL2=$(less error-log*-PM* | grep "Connection reset by peer" | grep "provider-login" | wc -l)
AMCONNECTAOL2=$(less error-log*-AM* | grep "Connection reset by peer" | grep "accessonline" | wc -l)
PMCONNECTAOL2=$(less error-log*-PM* | grep "Connection reset by peer" | grep "accessonline" | wc -l)
AMCONNECTINT2=$(less error-log*-AM* | grep "Connection reset by peer" | grep "intercom" | wc -l)
PMCONNECTINT2=$(less error-log*-PM* | grep "Connection reset by peer" | grep "intercom" | wc -l)

cd /home/cruiseprod/Traffic_Distribution/prod/wa01/

AMPPHQINTRA1=$(less access-log*-AM* | grep "webadmin/wellness" | wc -l)
AMCONSULT1=$(less access-log*-AM* | grep "webadmin/consult" | wc -l)
PMPPHQINTRA1=$(less access-log*-PM* | grep "webadmin/wellness" | wc -l)
PMCONSULT1=$(less access-log*-PM* | grep "webadmin/consult" | wc -l)
AMEMAIL1=$(less access-log*-AM* | grep "webadmin/email-collection-admin" | wc -l)
PMEMAIL1=$(less access-log*-PM* | grep "webadmin/email-collection-admin" | wc -l)
AMSELBUPA1=$(less access-log*-AM* | grep "webadmin/selling2bupa/includes" | wc -l)
PMSELBUPA1=$(less access-log*-PM* | grep "webadmin/selling2bupa/includes" | wc -l)
AMSYSREP1=$(less access-log*-AM* | grep "webadmin/sysrep" | wc -l)
PMSYSREP1=$(less access-log*-PM* | grep "webadmin/sysrep" | wc -l)

cd /home/cruiseprod/Traffic_Distribution/prod/wa02/

AMPPHQINTRA2=$(less access-log*-AM* | grep "webadmin/wellness" | wc -l)
AMCONSULT2=$(less access-log*-AM* | grep "webadmin/consult" | wc -l)
PMPPHQINTRA2=$(less access-log*-PM* | grep "webadmin/wellness" | wc -l)
PMCONSULT2=$(less access-log*-PM* | grep "webadmin/consult" | wc -l)
AMEMAIL2=$(less access-log*-AM* | grep "webadmin/email-collection-admin" | wc -l)
PMEMAIL2=$(less access-log*-PM* | grep "webadmin/email-collection-admin" | wc -l)
AMSELBUPA2=$(less access-log*-AM* | grep "webadmin/selling2bupa/includes" | wc -l)
PMSELBUPA2=$(less access-log*-PM* | grep "webadmin/selling2bupa/includes" | wc -l)
AMSYSREP2=$(less access-log*-AM* | grep "webadmin/sysrep" | wc -l)
PMSYSREP2=$(less access-log*-PM* | grep "webadmin/sysrep" | wc -l)

cd /home/cruiseprod/Traffic_Distribution/nft/wi01/

NFAMBBY1=$(less access-log*-AM* | grep "quote-process" | wc -l)
NFAMPOL1=$(less access-log*-AM* | grep "providers-online" | wc -l)
NFAMAOL1=$(less access-log*-AM* | grep "accessonline" | wc -l)
NFAMINT1=$(less access-log*-AM* | grep "intercom" | wc -l)
NFPMINT1=$(less access-log*-PM* | grep "intercom" | wc -l)
NFPMBBY1=$(less access-log*-PM* | grep "quote-process" | wc -l)
NFPMPOL1=$(less access-log*-PM* | grep "providers-online" | wc -l)
NFPMAOL1=$(less access-log*-PM* | grep "accessonline" | wc -l)
NFAMCONNECTPOL1=$(less error-log*-AM* | grep "Connection reset by peer" | grep "provider-login" | wc -l)
NFPMCONNECTPOL1=$(less error-log*-PM* | grep "Connection reset by peer" | grep "provider-login" | wc -l)
NFAMCONNECTAOL1=$(less error-log*-AM* | grep "Connection reset by peer" | grep "accessonline" | wc -l)
NFPMCONNECTAOL1=$(less error-log*-PM* | grep "Connection reset by peer" | grep "accessonline" | wc -l)
NFAMCONNECTINT1=$(less error-log*-AM* | grep "Connection reset by peer" | grep "intercom" | wc -l)
NFPMCONNECTINT1=$(less error-log*-PM* | grep "Connection reset by peer" | grep "intercom" | wc -l)

cd /home/cruiseprod/Traffic_Distribution/nft/wi02/

NFAMBBY2=$(less access-log*-AM* | grep "quote-process" | wc -l)
NFAMPOL2=$(less access-log*-AM* | grep "providers-online" | wc -l)
NFAMAOL2=$(less access-log*-AM* | grep "accessonline" | wc -l)
NFAMINT2=$(less access-log*-AM* | grep "intercom" | wc -l)
NFPMBBY2=$(less access-log*-PM* | grep "quote-process" | wc -l)
NFPMPOL2=$(less access-log*-PM* | grep "providers-online" | wc -l)
NFPMAOL2=$(less access-log*-PM* | grep "accessonline" | wc -l)
NFPMINT2=$(less access-log*-PM* | grep "intercom" | wc -l)
NFAMCONNECTPOL2=$(less error-log*-AM* | grep "Connection reset by peer" | grep "provider-login" | wc -l)
NFPMCONNECTPOL2=$(less error-log*-PM* | grep "Connection reset by peer" | grep "provider-login" | wc -l)
NFAMCONNECTAOL2=$(less error-log*-AM* | grep "Connection reset by peer" | grep "accessonline" | wc -l)
NFPMCONNECTAOL2=$(less error-log*-PM* | grep "Connection reset by peer" | grep "accessonline" | wc -l)
NFAMCONNECTINT2=$(less error-log*-AM* | grep "Connection reset by peer" | grep "intercom" | wc -l)
NFPMCONNECTINT2=$(less error-log*-PM* | grep "Connection reset by peer" | grep "intercom" | wc -l)

sleep 20

cd /home/cruiseprod/Traffic_Distribution


cat > traffic.txt <<end

Production:
___________________________________________________
                          | wi01 | AM |   $AMBBY1     
       BBY                |      | PM |   $PMBBY1     
                          |______|____|____________
                          | wi02 | AM |   $AMBBY2     
                          |      | PM |   $PMBBY2     
__________________________|______|____|____________	 
                          | wi01 | AM |   $AMPOL1     
       POL                |      | PM |   $PMPOL1     
                          |______|____|____________
	                    | wi02 | AM |   $AMPOL2   		
                          |      | PM |   $PMPOL2     
__________________________|______|____|____________
                          | wi01 | AM |   $AMAOL1     
      Access-online       |      | PM |   $PMAOL1     
                          |______|____|____________
                          | wi02 | AM |   $AMAOL2     
                          |      | PM |   $PMAOL2     
__________________________|______|____|____________
                          | wi01 | AM |   $AMINT1     
      Intercom            |      | PM |   $PMINT1     
                          |______|____|____________
                          | wi02 | AM |   $AMINT2     
                          |      | PM |   $PMINT2     
__________________________|______|____|____________
                          | wi01 | AM |   $AMMYBUPA1
      MY BUPA             |      | PM |   $PMMYBUPA1
                          |______|____|____________
                          | wi02 | AM |   $AMMYBUPA2
                          |      | PM |   $PMMYBUPA2
__________________________|______|____|____________
                          | wi01 | AM |   $AMWELLNESS1
      Wellnessprogramme   |      | PM |   $PMWELLNESS1
                          |______|____|____________
                          | wi02 | AM |   $AMWELLNESS2
                          |      | PM |   $PMWELLNESS2
__________________________|______|____|____________
                          |wi01  | AM |   $AMOCCHEA1
      OCC-Health          |      | PM |   $PMOCCHEA1
                          |______|____|____________
                          |wi02  | AM |   $AMOCCHEA2
                          |      | PM |   $PMOCCHEA2
__________________________|______|____|____________
                          |wi01  | AM |   $AMPPHQINTER1
      PPHQ-Internet       |      | PM |   $PMPPHQINTER1
                          |______|____|____________
                          |wi02  | AM |   $AMPPHQINTER2
                          |      | PM |   $PMPPHQINTER2
__________________________|______|____|____________
                          |wa01  | AM |   $AMPPHQINTRA1
      PPHQ-Intranet       |      | PM |   $PMPPHQINTRA1
                          |______|____|____________
                          |wa02  | AM |   $AMPPHQINTRA2
                          |      | PM |   $PMPPHQINTRA2
__________________________|______|____|____________
                          |wa01  | AM |   $AMEMAIL1
      Email-Collection    |      | PM |   $PMEMAIL1
                          |______|____|____________
                          |wa02  | AM |   $AMEMAIL2
                          |      | PM |   $PMEMAIL2
__________________________|______|____|____________
                          |      |    |
                          |wi01  | AM |   $AMINTEREMAIL1
      Email-Collection    |      | PM |   $PMINTEREMAIL1
                          |______|____|____________
                          |wi02  | AM |   $AMINTEREMAIL2
                          |      | PM |   $PMINTEREMAIL2
__________________________|______|____|____________
                          |      |    |
                          | wi01 | AM |   $AMSME1
      SME                 |      | PM |   $PMSME1
                          |______|____|____________
                          | wi02 | AM |   $AMSME2
                          |      | PM |   $PMSME2
__________________________|______|____|____________
                          | wi01 | AM |   $AMMPA1
      MPA                 |      | PM |   $PMMPA1
                          |______|____|____________
                          | wi02 | AM |   $AMMPA2
                          |      | PM |   $PMMPA2
__________________________|______|____|____________
                          | wa01 | AM |   $AMCONSULT1
      Consult             |      | PM |   $PMCONSULT1
                          |______|____|____________
                          | wa02 | AM |   $AMCONSULT2
                          |      | PM |   $PMCONSULT2
__________________________|______|____|____________
                          | wa01 | AM |   $AMSYSREP1
      SysRep              |      | PM |   $PMSYSREP1
                          |______|____|____________
                          | wa02 | AM |   $AMSYSREP2
                          |      | PM |   $PMSYSREP2
__________________________|______|____|____________
                          | wa01 | AM |   $AMSELBUPA1
      Selling2BUPA        |      | PM |   $PMSELBUPA1
                          |______|____|____________
                          | wa02 | AM |   $AMSELBUPA2
                          |      | PM |   $PMSELBUPA2
__________________________|______|____|____________
                          | wi01 | AM |   $AMINTLSUC1
  Bupa-intil              |      | PM |   $PMINTLSUC1
  (200 References)        |______|____|____________
                          | wi02 | AM |   $AMINTLSUC2
                          |      | PM |   $PMINTLSUC2
__________________________|______|____|____________
                          | wi01 | AM |   $AMINTLPER1
  Bupa-intl               |      | PM |   $PMINTLPER1
  (301 References)        |______|____|____________
                          | wi02 | AM |   $AMINTLPER2
                          |      | PM |   $PMINTLPER2
__________________________|______|____|____________
                          | wi01 | AM |   $AMINTLTEM1
  Bupa-intl               |      | PM |   $PMINTLTEM1
   (302 References)       |______|____|____________
                          | wi02 | AM |   $AMINTLTEM2
                          |      | PM |   $AMINTLTEM2
__________________________|______|____|____________
                          |wi01  | AM |   $AMHEALTHINSU1
     www.bupa.co.uk/      |      | PM |   $PMHEALTHINSU1
     individuals/         |______|____|____________
     health-insurance     |wi02  | AM |   $AMHEALTHINSU2
                          |      | PM |   $PMHEALTHINSU2
__________________________|______|____|____________
                          | wi01 | AM |   $AMHEALTHASSES1
     www.bupa.co.uk/      |      | PM |   $PMHEALTHASSES1
     individuals/         |______|____|____________
     health-assessments/  | wi02 | AM |   $AMHEALTHASSES2
                          |      | PM |   $PMHEALTHASSES2
__________________________|______|____|____________
                          |wi01  | AM |   $AMSELFPAY1
     www.bupa.co.uk       |      | PM |   $PMSELFPAY1
     /individuals/        |______|____|____________
     self-pay-treatments  |wi02  | AM |   $AMSELFPAY2
                          |      | PM |   $PMSELFPAY2
__________________________|______|____|____________
                          |wi01  | AM |   $AMINTERMEDIARY1
     www.bupa.co.uk       |      | PM |   $PMINTERMEDIARY1
     /intermediaries/     |______|____|____________
                          |wi02  | AM |   $AMINTERMEDIARY2
                          |      | PM |   $PMINTERMEDIARY2
__________________________|______|____|____________
                          |wi01  | AM |   $AMDENTAL1
     www.bupa.co.uk/      |      | PM |   $PMDENTAL1
                          |______|____|____________
     dental               |wi02  | AM |   $AMDENTAL2
                          |      | PM |   $PMDENTAL2
__________________________|______|____|____________
                          |wi01  | AM |   $AMHEALTHINFO1
    www.bupa.co.uk/       |      | PM |   $PMHEALTHINFO1
    health-information    |______|____|____________
                          |wi02  | AM |   $AMHEALTHINFO2
                          |      | PM |   $PMHEALTHINFO2
__________________________|______|____|____________
                          |wi01  | AM |   $AMCARESERVICE1
    www.bupa.co.uk        |      | PM |   $PMCARESERVICE1
    /care-services        |______|____|____________
                          |wi02  | AM |   $AMCARESERVICE2
                          |      | PM |   $PMCARESERVICE2
________________________ _|______|____|____________
                          |wi01  | AM |   $AMBUSINES1
    www.bupa.co.uk/       |      | PM |   $PMBUSINES1
    business              |______|____|____________
                          |wi02  | AM |   $AMBUSINES2
                          |      | PM |   $PMBUSINES2
__________________________|______|____|____________
                          |wi01  | AM |   $AMCONNECTPOL1
    Conn-Reset by         |      | PM |   $PMCONNECTPOL1
                          |______|____|____________
    Peer for POL          |wi02  | AM |   $AMCONNECTPOL2
                          |      | PM |   $PMCONNECTPOL2
__________________________|______|____|____________
                          |wi01  | AM |   $AMCONNECTAOL1
    Conn-Reset by         |      | PM |   $PMCONNECTAOL1
                          |______|____|____________
    Peer for AOL          |wi02  | AM |   $AMCONNECTAOL2
                          |      | PM |   $PMCONNECTAOL2
________________________ _|______|____|____________
                          |wi01  | AM |   $AMCONNECTINT1
    Conn-Reset by         |      | PM |   $PMCONNECTINT1
                          |______|____|____________
    Peer for Intercom     |wi02  | AM |   $AMCONNECTINT2
                          |      | PM |   $PMCONNECTINT2
__________________________|______|____|____________


NFT:

___________________________________
 BBY      | wi01 | AM |   $NFAMBBY1  
          |      | PM |   $NFPMBBY1  
          |______|____|____________
          | wi02 | AM |   $NFAMBBY2  
          |      | PM |   $NFPMBBY2 
__________|______|____|____________
 POL      | wi01 | AM |   $NFAMPOL1 
          |      | PM |   $NFPMPOL1 
          |______|____|____________
          | wi02 | AM |   $NFAMPOL2 
          |      | PM |   $NFPMPOL2 
__________|______|____|____________
 AOL      | wi01 | AM |   $NFAMAOL1 
          |      | PM |   $NFPMAOL1 
          |______|____|____________
          | wi02 | AM |   $NFAMAOL2 
          |      | PM |   $NFPMAOL2 
__________|______|____|____________
 Intercom | wi01 | AM |   $NFAMINT1 
          |      | PM |   $NFPMINT1 
          |______|____|____________
          | wi02 | AM |   $NFAMINT2 
          |      | PM |   $NFPMINT2 
__________|______|____|____________
Conn      |wi01  | AM |   $NFAMCONNECTPOL1
Reset by  |      | PM |   $NFPMCONNECTPOL1
Peer for  |______|____|____________
 POL      |wi02  | AM |   $NFAMCONNECTPOL2
          |      | PM |   $NFPMCONNECTPOL2
__________|______|____|____________
Conn      |wi01  | AM |   $NFAMCONNECTAOL1
Reset by  |      | PM |   $NFPMCONNECTAOL1
Peer for  |______|____|____________
 Access   |wi02  | AM |   $NFAMCONNECTAOL2
 Online   |      | PM |   $NFPMCONNECTAOL2
__________|______|____|____________
Conn      |wi01  | AM |   $NFAMCONNECTINT1
Reset by  |      | PM |   $NFPMCONNECTINT1
Peer for  |______|____|____________
 Intercom |wi02  | AM |   $NFAMCONNECTINT2
          |      | PM |   $NFPMCONNECTINT2
__________|______|____|____________


end


mail -s "Traffic distribution for $(date +20%y-%m-%d)" test@test.com -c test@test.com< /home/cruiseprod/Traffic_Distribution/traffic.txt

rm -rf prod nft
 
exit

for($i=1; $i -lt 100; $i++){$destFolder="A"+$i.ToString();if(-NOT (Test-Path ($destFolder))){mkdir $destFolder;cd $destFolder;break;}}; $agentZip="$PWD\agent.zip";$DefaultProxy=[System.Net.WebRequest]::DefaultWebProxy;$securityProtocol=@();$securityProtocol+=[Net.ServicePointManager]::SecurityProtocol;$securityProtocol+=[Net.SecurityProtocolType]::Tls12;[Net.ServicePointManager]::SecurityProtocol=$securityProtocol;$WebClient=New-Object Net.WebClient; $Uri='https://vstsagentpackage.azureedge.net/agent/2.177.1/vsts-agent-win-x64-2.177.1.zip';if($DefaultProxy -and (-not $DefaultProxy.IsBypassed($Uri))){$WebClient.Proxy= New-Object Net.WebProxy($DefaultProxy.GetProxy($Uri).OriginalString, $True);}; $WebClient.DownloadFile($Uri, $agentZip);Add-Type -AssemblyName System.IO.Compression.FileSystem;[System.IO.Compression.ZipFile]::ExtractToDirectory( $agentZip, "$PWD");.\config.cmd --deploymentgroup --deploymentgroupname "UAT" --agent $env:COMPUTERNAME --runasservice --work '_work' --url 'https://vstsepsilon.visualstudio.com/' --projectname 'DTS-Core' --auth PAT --token emys6i64daowum53gomvyogfyl3dekbu3beqi625rwm35dvaebxa --proxyurl http://10.211.128.0:80; Remove-Item $agentZip;



LGN\svc_Azure_NonProd
d3V0p$_N0pRoD
