IBDEI042 ; ; 12-JAN-2012
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JAN 12, 2012
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,5178,0)
 ;;=610.2^^47^358^58
 ;;^UTILITY(U,$J,358.3,5178,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5178,1,3,0)
 ;;=3^610.2
 ;;^UTILITY(U,$J,358.3,5178,1,4,0)
 ;;=4^Other and unspecifed ovarian cyst
 ;;^UTILITY(U,$J,358.3,5178,2)
 ;;=^46188
 ;;^UTILITY(U,$J,358.3,5179,0)
 ;;=626.6^^47^358^54
 ;;^UTILITY(U,$J,358.3,5179,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5179,1,3,0)
 ;;=3^626.6
 ;;^UTILITY(U,$J,358.3,5179,1,4,0)
 ;;=4^Metrorrhagia
 ;;^UTILITY(U,$J,358.3,5179,2)
 ;;=^77222
 ;;^UTILITY(U,$J,358.3,5180,0)
 ;;=626.7^^47^358^68
 ;;^UTILITY(U,$J,358.3,5180,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5180,1,3,0)
 ;;=3^626.7
 ;;^UTILITY(U,$J,358.3,5180,1,4,0)
 ;;=4^Post Coital Bleeding
 ;;^UTILITY(U,$J,358.3,5180,2)
 ;;=^270572
 ;;^UTILITY(U,$J,358.3,5181,0)
 ;;=627.3^^47^358^69
 ;;^UTILITY(U,$J,358.3,5181,1,0)
 ;;=^358.31IA^4^2
 ;;^UTILITY(U,$J,358.3,5181,1,3,0)
 ;;=3^627.3
 ;;^UTILITY(U,$J,358.3,5181,1,4,0)
 ;;=4^Postmenopausal Atrophic Vaginitis
 ;;^UTILITY(U,$J,358.3,5181,2)
 ;;=^270577
 ;;^UTILITY(U,$J,358.3,5182,0)
 ;;=99377^^48^359^1^^^^1
 ;;^UTILITY(U,$J,358.3,5182,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5182,1,1,0)
 ;;=1^99377
 ;;^UTILITY(U,$J,358.3,5182,1,2,0)
 ;;=2^Hospice Care Supervision,15-29 min
 ;;^UTILITY(U,$J,358.3,5183,0)
 ;;=99378^^48^359^2^^^^1
 ;;^UTILITY(U,$J,358.3,5183,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5183,1,1,0)
 ;;=1^99378
 ;;^UTILITY(U,$J,358.3,5183,1,2,0)
 ;;=2^Hospice Care Supervision,30 min or more
 ;;^UTILITY(U,$J,358.3,5184,0)
 ;;=G0182^^48^359^12^^^^1
 ;;^UTILITY(U,$J,358.3,5184,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5184,1,1,0)
 ;;=1^G0182
 ;;^UTILITY(U,$J,358.3,5184,1,2,0)
 ;;=2^Hospice Care-Use with each encounter
 ;;^UTILITY(U,$J,358.3,5185,0)
 ;;=99201^^49^360^1
 ;;^UTILITY(U,$J,358.3,5185,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5185,1,1,0)
 ;;=1^BRIEF EXAM
 ;;^UTILITY(U,$J,358.3,5185,1,2,0)
 ;;=2^99201
 ;;^UTILITY(U,$J,358.3,5186,0)
 ;;=99202^^49^360^2
 ;;^UTILITY(U,$J,358.3,5186,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5186,1,1,0)
 ;;=1^LIMITED EXAM
 ;;^UTILITY(U,$J,358.3,5186,1,2,0)
 ;;=2^99202
 ;;^UTILITY(U,$J,358.3,5187,0)
 ;;=99203^^49^360^3
 ;;^UTILITY(U,$J,358.3,5187,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5187,1,1,0)
 ;;=1^INTERMEDIATE EXAM
 ;;^UTILITY(U,$J,358.3,5187,1,2,0)
 ;;=2^99203
 ;;^UTILITY(U,$J,358.3,5188,0)
 ;;=99204^^49^360^4
 ;;^UTILITY(U,$J,358.3,5188,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5188,1,1,0)
 ;;=1^EXTENDED EXAM
 ;;^UTILITY(U,$J,358.3,5188,1,2,0)
 ;;=2^99204
 ;;^UTILITY(U,$J,358.3,5189,0)
 ;;=99205^^49^360^5
 ;;^UTILITY(U,$J,358.3,5189,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5189,1,1,0)
 ;;=1^COMPREHENSIVE EXAM
 ;;^UTILITY(U,$J,358.3,5189,1,2,0)
 ;;=2^99205
 ;;^UTILITY(U,$J,358.3,5190,0)
 ;;=99211^^49^361^1
 ;;^UTILITY(U,$J,358.3,5190,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5190,1,1,0)
 ;;=1^BRIEF EXAM
 ;;^UTILITY(U,$J,358.3,5190,1,2,0)
 ;;=2^99211
 ;;^UTILITY(U,$J,358.3,5191,0)
 ;;=99212^^49^361^2
 ;;^UTILITY(U,$J,358.3,5191,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5191,1,1,0)
 ;;=1^LIMITED EXAM
 ;;^UTILITY(U,$J,358.3,5191,1,2,0)
 ;;=2^99212
 ;;^UTILITY(U,$J,358.3,5192,0)
 ;;=99213^^49^361^3
 ;;^UTILITY(U,$J,358.3,5192,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5192,1,1,0)
 ;;=1^INTERMEDIATE EXAM
 ;;^UTILITY(U,$J,358.3,5192,1,2,0)
 ;;=2^99213
 ;;^UTILITY(U,$J,358.3,5193,0)
 ;;=99214^^49^361^4
 ;;^UTILITY(U,$J,358.3,5193,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5193,1,1,0)
 ;;=1^EXTENDED EXAM
 ;;^UTILITY(U,$J,358.3,5193,1,2,0)
 ;;=2^99214
 ;;^UTILITY(U,$J,358.3,5194,0)
 ;;=99215^^49^361^5
 ;;^UTILITY(U,$J,358.3,5194,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5194,1,1,0)
 ;;=1^COMPREHENSIVE EXAM
 ;;^UTILITY(U,$J,358.3,5194,1,2,0)
 ;;=2^99215
 ;;^UTILITY(U,$J,358.3,5195,0)
 ;;=99241^^49^362^1
 ;;^UTILITY(U,$J,358.3,5195,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5195,1,1,0)
 ;;=1^BRIEF EXAM
 ;;^UTILITY(U,$J,358.3,5195,1,2,0)
 ;;=2^99241
 ;;^UTILITY(U,$J,358.3,5196,0)
 ;;=99242^^49^362^2
 ;;^UTILITY(U,$J,358.3,5196,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5196,1,1,0)
 ;;=1^LIMITED EXAM
 ;;^UTILITY(U,$J,358.3,5196,1,2,0)
 ;;=2^99242
 ;;^UTILITY(U,$J,358.3,5197,0)
 ;;=99243^^49^362^3
 ;;^UTILITY(U,$J,358.3,5197,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5197,1,1,0)
 ;;=1^INTERMEDIATE EXAM
 ;;^UTILITY(U,$J,358.3,5197,1,2,0)
 ;;=2^99243
 ;;^UTILITY(U,$J,358.3,5198,0)
 ;;=99244^^49^362^4
 ;;^UTILITY(U,$J,358.3,5198,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5198,1,1,0)
 ;;=1^EXTENDED EXAM
 ;;^UTILITY(U,$J,358.3,5198,1,2,0)
 ;;=2^99244
 ;;^UTILITY(U,$J,358.3,5199,0)
 ;;=99245^^49^362^5
 ;;^UTILITY(U,$J,358.3,5199,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5199,1,1,0)
 ;;=1^COMPREHENSIVE EXAM
 ;;^UTILITY(U,$J,358.3,5199,1,2,0)
 ;;=2^99245
 ;;^UTILITY(U,$J,358.3,5200,0)
 ;;=188.9^^50^363^5
 ;;^UTILITY(U,$J,358.3,5200,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5200,1,1,0)
 ;;=1^188.9
 ;;^UTILITY(U,$J,358.3,5200,1,2,0)
 ;;=2^BLADDER CANCER
 ;;^UTILITY(U,$J,358.3,5200,2)
 ;;=^267253
 ;;^UTILITY(U,$J,358.3,5201,0)
 ;;=162.9^^50^363^25
 ;;^UTILITY(U,$J,358.3,5201,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5201,1,1,0)
 ;;=1^162.9
 ;;^UTILITY(U,$J,358.3,5201,1,2,0)
 ;;=2^LUNG CANCER
 ;;^UTILITY(U,$J,358.3,5201,2)
 ;;=^73521
 ;;^UTILITY(U,$J,358.3,5202,0)
 ;;=191.9^^50^363^7
 ;;^UTILITY(U,$J,358.3,5202,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5202,1,1,0)
 ;;=1^191.9
 ;;^UTILITY(U,$J,358.3,5202,1,2,0)
 ;;=2^BRAIN CANCER
 ;;^UTILITY(U,$J,358.3,5202,2)
 ;;=^267279
 ;;^UTILITY(U,$J,358.3,5203,0)
 ;;=171.9^^50^363^50
 ;;^UTILITY(U,$J,358.3,5203,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5203,1,1,0)
 ;;=1^171.9
 ;;^UTILITY(U,$J,358.3,5203,1,2,0)
 ;;=2^SARCOMAS/OTH SOFT TISSUE CANCER
 ;;^UTILITY(U,$J,358.3,5203,2)
 ;;=^267165
 ;;^UTILITY(U,$J,358.3,5204,0)
 ;;=150.9^^50^363^16
 ;;^UTILITY(U,$J,358.3,5204,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5204,1,1,0)
 ;;=1^150.9
 ;;^UTILITY(U,$J,358.3,5204,1,2,0)
 ;;=2^ESOPHAGEAL CANCER
 ;;^UTILITY(U,$J,358.3,5204,2)
 ;;=^267055
 ;;^UTILITY(U,$J,358.3,5205,0)
 ;;=153.9^^50^363^15
 ;;^UTILITY(U,$J,358.3,5205,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5205,1,1,0)
 ;;=1^153.9
 ;;^UTILITY(U,$J,358.3,5205,1,2,0)
 ;;=2^COLON CANCER
 ;;^UTILITY(U,$J,358.3,5205,2)
 ;;=^267078
 ;;^UTILITY(U,$J,358.3,5206,0)
 ;;=152.9^^50^363^55
 ;;^UTILITY(U,$J,358.3,5206,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5206,1,1,0)
 ;;=1^152.9
 ;;^UTILITY(U,$J,358.3,5206,1,2,0)
 ;;=2^SMALL INTESTINE CANCER
 ;;^UTILITY(U,$J,358.3,5206,2)
 ;;=^267077
 ;;^UTILITY(U,$J,358.3,5207,0)
 ;;=193.^^50^363^60
 ;;^UTILITY(U,$J,358.3,5207,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5207,1,1,0)
 ;;=1^193.
 ;;^UTILITY(U,$J,358.3,5207,1,2,0)
 ;;=2^THYROID CANCER
 ;;^UTILITY(U,$J,358.3,5207,2)
 ;;=^267296
 ;;^UTILITY(U,$J,358.3,5208,0)
 ;;=284.9^^50^363^3
 ;;^UTILITY(U,$J,358.3,5208,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5208,1,1,0)
 ;;=1^284.9
 ;;^UTILITY(U,$J,358.3,5208,1,2,0)
 ;;=2^APLASTIC ANEMIA NOS
 ;;^UTILITY(U,$J,358.3,5208,2)
 ;;=^7020
 ;;^UTILITY(U,$J,358.3,5209,0)
 ;;=170.9^^50^363^6
 ;;^UTILITY(U,$J,358.3,5209,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5209,1,1,0)
 ;;=1^170.9
 ;;^UTILITY(U,$J,358.3,5209,1,2,0)
 ;;=2^BONE AND CARTILAGE CANCER
 ;;^UTILITY(U,$J,358.3,5209,2)
 ;;=^267155
 ;;^UTILITY(U,$J,358.3,5210,0)
 ;;=175.9^^50^363^9
 ;;^UTILITY(U,$J,358.3,5210,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5210,1,1,0)
 ;;=1^175.9
 ;;^UTILITY(U,$J,358.3,5210,1,2,0)
 ;;=2^BREAST CANCER-MALE
 ;;^UTILITY(U,$J,358.3,5210,2)
 ;;=^267205
 ;;^UTILITY(U,$J,358.3,5211,0)
 ;;=209.10^^50^363^10
 ;;^UTILITY(U,$J,358.3,5211,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5211,1,1,0)
 ;;=1^209.10
 ;;^UTILITY(U,$J,358.3,5211,1,2,0)
 ;;=2^CARCINOID, LARGE INTESTINE
 ;;^UTILITY(U,$J,358.3,5211,2)
 ;;=^336722
 ;;^UTILITY(U,$J,358.3,5212,0)
 ;;=209.29^^50^363^11
 ;;^UTILITY(U,$J,358.3,5212,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5212,1,1,0)
 ;;=1^209.29
 ;;^UTILITY(U,$J,358.3,5212,1,2,0)
 ;;=2^CARCINOID,NONBOWEL AND OTH SITE
 ;;^UTILITY(U,$J,358.3,5212,2)
 ;;=^336507
 ;;^UTILITY(U,$J,358.3,5213,0)
 ;;=209.00^^50^363^12
 ;;^UTILITY(U,$J,358.3,5213,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5213,1,1,0)
 ;;=1^209.00
 ;;^UTILITY(U,$J,358.3,5213,1,2,0)
 ;;=2^CARCINOID,SMALL INTESTINE
 ;;^UTILITY(U,$J,358.3,5213,2)
 ;;=^336721
 ;;^UTILITY(U,$J,358.3,5214,0)
 ;;=156.9^^50^363^13
 ;;^UTILITY(U,$J,358.3,5214,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5214,1,1,0)
 ;;=1^156.9
 ;;^UTILITY(U,$J,358.3,5214,1,2,0)
 ;;=2^CHOLANGIOCARCINOMA
 ;;^UTILITY(U,$J,358.3,5214,2)
 ;;=^267102
 ;;^UTILITY(U,$J,358.3,5215,0)
 ;;=286.9^^50^363^14
 ;;^UTILITY(U,$J,358.3,5215,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5215,1,1,0)
 ;;=1^286.9
 ;;^UTILITY(U,$J,358.3,5215,1,2,0)
 ;;=2^COAGULATION DEFECTS
 ;;^UTILITY(U,$J,358.3,5215,2)
 ;;=^87267
 ;;^UTILITY(U,$J,358.3,5216,0)
 ;;=156.9^^50^363^17
 ;;^UTILITY(U,$J,358.3,5216,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5216,1,1,0)
 ;;=1^156.9
 ;;^UTILITY(U,$J,358.3,5216,1,2,0)
 ;;=2^GALLBLADDER CANCER
 ;;^UTILITY(U,$J,358.3,5216,2)
 ;;=^267102
 ;;^UTILITY(U,$J,358.3,5217,0)
 ;;=459.0^^50^363^19
 ;;^UTILITY(U,$J,358.3,5217,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5217,1,1,0)
 ;;=1^459.0
 ;;^UTILITY(U,$J,358.3,5217,1,2,0)
 ;;=2^HEMORRHAGE NOS
 ;;^UTILITY(U,$J,358.3,5217,2)
 ;;=^55877
 ;;^UTILITY(U,$J,358.3,5218,0)
 ;;=176.9^^50^363^20
 ;;^UTILITY(U,$J,358.3,5218,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5218,1,1,0)
 ;;=1^176.9
 ;;^UTILITY(U,$J,358.3,5218,1,2,0)
 ;;=2^KAPOSI'S SARCOMA, NOS
 ;;^UTILITY(U,$J,358.3,5218,2)
 ;;=^107993
 ;;^UTILITY(U,$J,358.3,5219,0)
 ;;=161.9^^50^363^21
 ;;^UTILITY(U,$J,358.3,5219,1,0)
 ;;=^358.31IA^2^2
 ;;^UTILITY(U,$J,358.3,5219,1,1,0)
 ;;=1^161.9
 ;;^UTILITY(U,$J,358.3,5219,1,2,0)
 ;;=2^LARYNGEAL CANCER