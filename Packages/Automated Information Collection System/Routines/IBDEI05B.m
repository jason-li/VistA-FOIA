IBDEI05B ; ; 12-JAN-2012
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JAN 12, 2012
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,6923,1,5,0)
 ;;=5^Abrasion, infected
 ;;^UTILITY(U,$J,358.3,6923,2)
 ;;=^275358
 ;;^UTILITY(U,$J,358.3,6924,0)
 ;;=919.0^^59^434^17
 ;;^UTILITY(U,$J,358.3,6924,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6924,1,4,0)
 ;;=4^919.0
 ;;^UTILITY(U,$J,358.3,6924,1,5,0)
 ;;=5^Abrasion, Not infected
 ;;^UTILITY(U,$J,358.3,6924,2)
 ;;=^1305
 ;;^UTILITY(U,$J,358.3,6925,0)
 ;;=780.02^^59^434^20
 ;;^UTILITY(U,$J,358.3,6925,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6925,1,4,0)
 ;;=4^780.02
 ;;^UTILITY(U,$J,358.3,6925,1,5,0)
 ;;=5^Altered Awareness, Transient
 ;;^UTILITY(U,$J,358.3,6925,2)
 ;;=^293932
 ;;^UTILITY(U,$J,358.3,6926,0)
 ;;=780.01^^59^434^22
 ;;^UTILITY(U,$J,358.3,6926,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6926,1,4,0)
 ;;=4^780.01
 ;;^UTILITY(U,$J,358.3,6926,1,5,0)
 ;;=5^Altered consciousness, coma
 ;;^UTILITY(U,$J,358.3,6926,2)
 ;;=^263540
 ;;^UTILITY(U,$J,358.3,6927,0)
 ;;=783.0^^59^434^23
 ;;^UTILITY(U,$J,358.3,6927,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6927,1,4,0)
 ;;=4^783.0
 ;;^UTILITY(U,$J,358.3,6927,1,5,0)
 ;;=5^Anorexia
 ;;^UTILITY(U,$J,358.3,6927,2)
 ;;=Anorexia^7939
 ;;^UTILITY(U,$J,358.3,6928,0)
 ;;=V58.61^^59^434^24
 ;;^UTILITY(U,$J,358.3,6928,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6928,1,4,0)
 ;;=4^V58.61
 ;;^UTILITY(U,$J,358.3,6928,1,5,0)
 ;;=5^Anticoagulant Rx, Long Term
 ;;^UTILITY(U,$J,358.3,6928,2)
 ;;=^303459
 ;;^UTILITY(U,$J,358.3,6929,0)
 ;;=724.2^^59^434^95
 ;;^UTILITY(U,$J,358.3,6929,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6929,1,4,0)
 ;;=4^724.2
 ;;^UTILITY(U,$J,358.3,6929,1,5,0)
 ;;=5^Low Back Pain
 ;;^UTILITY(U,$J,358.3,6929,2)
 ;;=^71885
 ;;^UTILITY(U,$J,358.3,6930,0)
 ;;=724.5^^59^434^28
 ;;^UTILITY(U,$J,358.3,6930,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6930,1,4,0)
 ;;=4^724.5
 ;;^UTILITY(U,$J,358.3,6930,1,5,0)
 ;;=5^Back Pain, Thoracic
 ;;^UTILITY(U,$J,358.3,6930,2)
 ;;=^12250
 ;;^UTILITY(U,$J,358.3,6931,0)
 ;;=919.3^^59^434^30
 ;;^UTILITY(U,$J,358.3,6931,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6931,1,4,0)
 ;;=4^919.3
 ;;^UTILITY(U,$J,358.3,6931,1,5,0)
 ;;=5^Blister, Infected
 ;;^UTILITY(U,$J,358.3,6931,2)
 ;;=^275359
 ;;^UTILITY(U,$J,358.3,6932,0)
 ;;=919.2^^59^434^31
 ;;^UTILITY(U,$J,358.3,6932,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6932,1,4,0)
 ;;=4^919.2
 ;;^UTILITY(U,$J,358.3,6932,1,5,0)
 ;;=5^Blister, Not infected
 ;;^UTILITY(U,$J,358.3,6932,2)
 ;;=^15350
 ;;^UTILITY(U,$J,358.3,6933,0)
 ;;=799.4^^59^434^33
 ;;^UTILITY(U,$J,358.3,6933,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6933,1,4,0)
 ;;=4^799.4
 ;;^UTILITY(U,$J,358.3,6933,1,5,0)
 ;;=5^Cachexia
 ;;^UTILITY(U,$J,358.3,6933,2)
 ;;=Cachexia^17920
 ;;^UTILITY(U,$J,358.3,6934,0)
 ;;=780.71^^59^434^38
 ;;^UTILITY(U,$J,358.3,6934,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6934,1,4,0)
 ;;=4^780.71
 ;;^UTILITY(U,$J,358.3,6934,1,5,0)
 ;;=5^Chronic fatigue syndrome
 ;;^UTILITY(U,$J,358.3,6934,2)
 ;;=^304659
 ;;^UTILITY(U,$J,358.3,6935,0)
 ;;=781.5^^59^434^39
 ;;^UTILITY(U,$J,358.3,6935,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6935,1,4,0)
 ;;=4^781.5
 ;;^UTILITY(U,$J,358.3,6935,1,5,0)
 ;;=5^Clubbing of fingers
 ;;^UTILITY(U,$J,358.3,6935,2)
 ;;=^273354
 ;;^UTILITY(U,$J,358.3,6936,0)
 ;;=780.39^^59^434^125
 ;;^UTILITY(U,$J,358.3,6936,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6936,1,4,0)
 ;;=4^780.39
 ;;^UTILITY(U,$J,358.3,6936,1,5,0)
 ;;=5^Seizures
 ;;^UTILITY(U,$J,358.3,6936,2)
 ;;=Seizures^28162
 ;;^UTILITY(U,$J,358.3,6937,0)
 ;;=780.4^^59^434^51
 ;;^UTILITY(U,$J,358.3,6937,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6937,1,4,0)
 ;;=4^780.4
 ;;^UTILITY(U,$J,358.3,6937,1,5,0)
 ;;=5^Dizziness and Giddiness
 ;;^UTILITY(U,$J,358.3,6937,2)
 ;;=^35946
 ;;^UTILITY(U,$J,358.3,6938,0)
 ;;=782.3^^59^434^57
 ;;^UTILITY(U,$J,358.3,6938,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6938,1,4,0)
 ;;=4^782.3
 ;;^UTILITY(U,$J,358.3,6938,1,5,0)
 ;;=5^Edema
 ;;^UTILITY(U,$J,358.3,6938,2)
 ;;=Edema^38340
 ;;^UTILITY(U,$J,358.3,6939,0)
 ;;=457.1^^59^434^58
 ;;^UTILITY(U,$J,358.3,6939,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6939,1,4,0)
 ;;=4^457.1
 ;;^UTILITY(U,$J,358.3,6939,1,5,0)
 ;;=5^Edema due to lymphatic obstruction
 ;;^UTILITY(U,$J,358.3,6939,2)
 ;;=   ^87693
 ;;^UTILITY(U,$J,358.3,6940,0)
 ;;=459.2^^59^434^59
 ;;^UTILITY(U,$J,358.3,6940,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6940,1,4,0)
 ;;=4^459.2
 ;;^UTILITY(U,$J,358.3,6940,1,5,0)
 ;;=5^Edema due to venous obstruction 
 ;;^UTILITY(U,$J,358.3,6940,2)
 ;;=^269850
 ;;^UTILITY(U,$J,358.3,6941,0)
 ;;=780.79^^59^434^97
 ;;^UTILITY(U,$J,358.3,6941,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6941,1,4,0)
 ;;=4^780.79
 ;;^UTILITY(U,$J,358.3,6941,1,5,0)
 ;;=5^Malaise
 ;;^UTILITY(U,$J,358.3,6941,2)
 ;;=Malaise^73344
 ;;^UTILITY(U,$J,358.3,6942,0)
 ;;=783.3^^59^434^64
 ;;^UTILITY(U,$J,358.3,6942,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6942,1,4,0)
 ;;=4^783.3
 ;;^UTILITY(U,$J,358.3,6942,1,5,0)
 ;;=5^Feeding problem of the elderly
 ;;^UTILITY(U,$J,358.3,6942,2)
 ;;=   ^273364
 ;;^UTILITY(U,$J,358.3,6943,0)
 ;;=780.1^^59^434^69
 ;;^UTILITY(U,$J,358.3,6943,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6943,1,4,0)
 ;;=4^780.1
 ;;^UTILITY(U,$J,358.3,6943,1,5,0)
 ;;=5^Hallucinations
 ;;^UTILITY(U,$J,358.3,6943,2)
 ;;=Hallucinations^53738
 ;;^UTILITY(U,$J,358.3,6944,0)
 ;;=780.8^^59^434^78
 ;;^UTILITY(U,$J,358.3,6944,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6944,1,4,0)
 ;;=4^780.8
 ;;^UTILITY(U,$J,358.3,6944,1,5,0)
 ;;=5^Hyperhidrosis
 ;;^UTILITY(U,$J,358.3,6944,2)
 ;;=Hyperhidrosis^60030
 ;;^UTILITY(U,$J,358.3,6945,0)
 ;;=307.41^^59^434^89
 ;;^UTILITY(U,$J,358.3,6945,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6945,1,4,0)
 ;;=4^307.41
 ;;^UTILITY(U,$J,358.3,6945,1,5,0)
 ;;=5^Insomnia, Nonorganic, Transient
 ;;^UTILITY(U,$J,358.3,6945,2)
 ;;=^268285
 ;;^UTILITY(U,$J,358.3,6946,0)
 ;;=780.52^^59^434^90
 ;;^UTILITY(U,$J,358.3,6946,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6946,1,4,0)
 ;;=4^780.52
 ;;^UTILITY(U,$J,358.3,6946,1,5,0)
 ;;=5^Insomnia, Organic
 ;;^UTILITY(U,$J,358.3,6946,2)
 ;;=Insomnia, Organic^87662
 ;;^UTILITY(U,$J,358.3,6947,0)
 ;;=302.71^^59^434^93
 ;;^UTILITY(U,$J,358.3,6947,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6947,1,4,0)
 ;;=4^302.71
 ;;^UTILITY(U,$J,358.3,6947,1,5,0)
 ;;=5^Loss of Libido
 ;;^UTILITY(U,$J,358.3,6947,2)
 ;;=^268178
 ;;^UTILITY(U,$J,358.3,6948,0)
 ;;=785.6^^59^434^96
 ;;^UTILITY(U,$J,358.3,6948,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6948,1,4,0)
 ;;=4^785.6
 ;;^UTILITY(U,$J,358.3,6948,1,5,0)
 ;;=5^Lymphadenopathy
 ;;^UTILITY(U,$J,358.3,6948,2)
 ;;=Lymphadenopathy^72368
 ;;^UTILITY(U,$J,358.3,6949,0)
 ;;=728.85^^59^434^102
 ;;^UTILITY(U,$J,358.3,6949,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6949,1,4,0)
 ;;=4^728.85
 ;;^UTILITY(U,$J,358.3,6949,1,5,0)
 ;;=5^Muscle Spasm
 ;;^UTILITY(U,$J,358.3,6949,2)
 ;;=Muscle Spasm^112558
 ;;^UTILITY(U,$J,358.3,6950,0)
 ;;=782.0^^59^434^49
 ;;^UTILITY(U,$J,358.3,6950,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6950,1,4,0)
 ;;=4^782.0
 ;;^UTILITY(U,$J,358.3,6950,1,5,0)
 ;;=5^Disturbance of Skin Sensation
 ;;^UTILITY(U,$J,358.3,6950,2)
 ;;=Disturbance of Skin Sensation^35757
 ;;^UTILITY(U,$J,358.3,6951,0)
 ;;=278.00^^59^434^107
 ;;^UTILITY(U,$J,358.3,6951,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6951,1,4,0)
 ;;=4^278.00
 ;;^UTILITY(U,$J,358.3,6951,1,5,0)
 ;;=5^Obesity (2nd dx only)
 ;;^UTILITY(U,$J,358.3,6951,2)
 ;;=Obesity^84823
 ;;^UTILITY(U,$J,358.3,6952,0)
 ;;=278.01^^59^434^108
 ;;^UTILITY(U,$J,358.3,6952,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6952,1,4,0)
 ;;=4^278.01
 ;;^UTILITY(U,$J,358.3,6952,1,5,0)
 ;;=5^Obesity, Morbid
 ;;^UTILITY(U,$J,358.3,6952,2)
 ;;=Obesity, Morbid^84844
 ;;^UTILITY(U,$J,358.3,6953,0)
 ;;=783.5^^59^434^117
 ;;^UTILITY(U,$J,358.3,6953,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6953,1,4,0)
 ;;=4^783.5
 ;;^UTILITY(U,$J,358.3,6953,1,5,0)
 ;;=5^Polydipsia
 ;;^UTILITY(U,$J,358.3,6953,2)
 ;;=Polydipsia^186699
 ;;^UTILITY(U,$J,358.3,6954,0)
 ;;=783.6^^59^434^118
 ;;^UTILITY(U,$J,358.3,6954,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6954,1,4,0)
 ;;=4^783.6
 ;;^UTILITY(U,$J,358.3,6954,1,5,0)
 ;;=5^Polyphagia
 ;;^UTILITY(U,$J,358.3,6954,2)
 ;;=Polyphagia^60236
 ;;^UTILITY(U,$J,358.3,6955,0)
 ;;=780.2^^59^434^134
 ;;^UTILITY(U,$J,358.3,6955,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6955,1,4,0)
 ;;=4^780.2
 ;;^UTILITY(U,$J,358.3,6955,1,5,0)
 ;;=5^Syncope and Collapse
 ;;^UTILITY(U,$J,358.3,6955,2)
 ;;=^116707
 ;;^UTILITY(U,$J,358.3,6956,0)
 ;;=783.1^^59^434^146
 ;;^UTILITY(U,$J,358.3,6956,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6956,1,4,0)
 ;;=4^783.1
 ;;^UTILITY(U,$J,358.3,6956,1,5,0)
 ;;=5^Weight gain, abnormal
 ;;^UTILITY(U,$J,358.3,6956,2)
 ;;=^998
 ;;^UTILITY(U,$J,358.3,6957,0)
 ;;=783.21^^59^434^147
 ;;^UTILITY(U,$J,358.3,6957,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6957,1,4,0)
 ;;=4^783.21
 ;;^UTILITY(U,$J,358.3,6957,1,5,0)
 ;;=5^Weight loss, abnormal
 ;;^UTILITY(U,$J,358.3,6957,2)
 ;;=^322005
 ;;^UTILITY(U,$J,358.3,6958,0)
 ;;=796.2^^59^434^32
 ;;^UTILITY(U,$J,358.3,6958,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6958,1,4,0)
 ;;=4^796.2
 ;;^UTILITY(U,$J,358.3,6958,1,5,0)
 ;;=5^Blood Pressure Elevated, w/o HTN
 ;;^UTILITY(U,$J,358.3,6958,2)
 ;;=^273464
 ;;^UTILITY(U,$J,358.3,6959,0)
 ;;=790.92^^59^434^9
 ;;^UTILITY(U,$J,358.3,6959,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6959,1,4,0)
 ;;=4^790.92
 ;;^UTILITY(U,$J,358.3,6959,1,5,0)
 ;;=5^Abnorm Coagulation Profile
 ;;^UTILITY(U,$J,358.3,6959,2)
 ;;=Abnorm Coagulation Profile^295771
 ;;^UTILITY(U,$J,358.3,6960,0)
 ;;=794.31^^59^434^10
 ;;^UTILITY(U,$J,358.3,6960,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,6960,1,4,0)
 ;;=4^794.31
 ;;^UTILITY(U,$J,358.3,6960,1,5,0)
 ;;=5^Abnormal EKG
 ;;^UTILITY(U,$J,358.3,6960,2)
 ;;=Abnormal EKG^83844
 ;;^UTILITY(U,$J,358.3,6961,0)
 ;;=790.1^^59^434^61
 ;;^UTILITY(U,$J,358.3,6961,1,0)
 ;;=^358.31IA^5^2