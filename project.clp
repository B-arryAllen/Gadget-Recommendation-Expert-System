;----------------------------------------------------------------------------
; CLASSES
;----------------------------------------------------------------------------
(defclass PERSON
	(is-a USER)
	(role concrete)
	(slot company)
	(slot devicetype))

(defclass DEVICENAME
	(is-a USER)
	(slot company)
	(slot price)
	(slot suggested_device))

;----------------------------------------------------------------------------
; DEFAULT INSTANCES
;----------------------------------------------------------------------------

(definstances PERSON-INSTANCES
	(client of PERSON))

(definstances DEVICE-INSTANCES
	(which_device of DEVICENAME))

;----------------------------------------------------------------------------
; INITIAL USER INPUTS AND VALIDATIONS
;----------------------------------------------------------------------------

(deffunction user-input-validation (?question $?valid-input)
   (printout t ?question)
   (bind ?answer (read))
   (if (lexemep ?answer) 
       then (bind ?answer (lowcase ?answer)))
   (while (not (member ?answer ?valid-input)) do
      (printout t "Please enter a valid input as mentioned in the question!" crlf)
      (printout t ?question)
      (bind ?answer (read))
      (if (lexemep ?answer) 
          then (bind ?answer (lowcase ?answer))))
   ?answer)
   
; RULE TO GET THE USER INPUT
(defrule GetCompanion(declare (salience 10))
    =>
    (printout t crlf)
    (printout t "--------------------------------------------------------------------------------------------------------" crlf)
    (printout t "------------------------ WELCOME TO THE SMARTPHONES / TABLETS / PHABLETS EXPERT ------------------------" crlf)
    (printout t "--------------------------------------------------------------------------------------------------------" crlf)
    (printout t crlf)    
    (send [client] put-devicetype
    (user-input-validation "What do you want to buy? (mobile/tablet/phablet):  "mobile tablet phablet)))
   
;----------------------------------------------------------------------------
; RULES OF THE EXPERT SYSTEM TO SELECT THE DEVICE
;----------------------------------------------------------------------------

; RULE TO SELECT PERFECT MOBILE PHONE
(defrule buy_mobile
	?ins <- (object (is-a PERSON) (devicetype mobile))
	=> 
	(printout t crlf)
	(printout t "Let me select a Mobile suitable to buy in your budget..." crlf crlf)
   	(send [which_device] put-price
    (user-input-validation "Enter your preferred Price Range (under10k/ 10k-15k / 15k-25k / above25k):  "
    		under10k 10k-15k 15k-25k above25k)))
   	 
; RULE TO SELECT PERFECT TABLET
(defrule buy_tablet
	?ins <- (object (is-a PERSON) (devicetype tablet))
	=> 
	(printout t crlf)
	(printout t "Let me select a Tablet suitable to buy in your budget..." crlf crlf)
    (send [which_device] put-price
  	(user-input-validation "Enter your preferred Price Range (under20k / above20k): " 
  		under20k above20k)))
   	 
; RULE TO SELECT PERFECT PHABLET
(defrule buy_phablet
	?ins <- (object (is-a PERSON) (devicetype phablet))
	=> 
	(printout t crlf)
	(printout t "Let me select a Phablet suitable to buy in your budget..." crlf crlf)
	(send [which_device] put-price
    (user-input-validation "Enter your preferred Price Range (under15k / above15k): "
         under15k above15k)))
   	 
; RULE TO TABLET ABOVE 20K
(defrule tab_above20k
	(and ?ins <- (object (is-a DEVICENAME) (price above20k))
	(object (is-a PERSON)(devicetype tablet)))
	=> 
	(printout t crlf)
	(printout t "Let me select a Tablet above 20k..." crlf crlf)
	(send [which_device] put-company
    (user-input-validation "Enter your preferred company (apple/samsung/lenovo):  "
        apple samsung lenovo)))

; RULE TO TABLET UNDER 20K
(defrule tab_under20k
	(and ?ins <- (object (is-a DEVICENAME) (price under20k))
	(object (is-a PERSON)(devicetype tablet)))
	=> 
	(printout t crlf)
	(printout t "Let me select a Tablet under 20k..." crlf crlf)
	(send [which_device] put-company
    (user-input-validation "Enter your preferred company (asus):  "
        asus)))

   	
; RULE TO PHABLET ABOVE 15K
(defrule phab_above15k
	(and ?ins <- (object (is-a DEVICENAME) (price above15k))
	(object (is-a PERSON)(devicetype phablet)))
	=> 
	(printout t crlf)
	(printout t "Let me select a Phablet above 15K..." crlf crlf)
   	(send [which_device] put-company
   	(user-input-validation "Enter your preferred company (xiaomi/lenovo/huawei):  "
         xiaomi lenovo huawei)))

    ; RULE TO PHABLET UNDER 15K
(defrule phab_under15k
	(and ?ins <- (object (is-a DEVICENAME) (price under15k))
	(object (is-a PERSON)(devicetype phablet)))
	=> 
	(printout t crlf)
	(printout t "Let me select a Phablet under 15K..." crlf crlf)
   	(send [which_device] put-company
   	(user-input-validation "Enter your preferred company (micromax):  "
         micromax)))

; RULE TO MOBILE UNDER 10K
(defrule mob_under10k
	(and ?ins <- (object (is-a PERSON) (devicetype mobile))
	(object (is-a DEVICENAME) (price under10k)))
	=> 
	(printout t crlf)
	(printout t "Let me select a Mobile Phone Under 10K..." crlf crlf)
   	(send [client] put-company
   	(user-input-validation "Select your preferred company(xiaomi/asus/lenovo): "
         xiaomi asus lenovo)))

; RULE TO MOBILE 10K - 15K
(defrule mob_10k15k
	(and ?ins <- (object (is-a PERSON) (devicetype mobile))
	(object (is-a DEVICENAME) (price 10k-15k)))
	=> 
	(printout t crlf)
	(printout t "Let me select a Mobile Phone in range 10K - 15K..." crlf crlf)
   	(send [client] put-company
   	(user-input-validation "What is your preferred comapny? (lenovo/motorola/samsung):  "
         lenovo motorola samsung)))
   	 
; RULE TO MOBILE 15K - 25K
(defrule mob_15k25k
	(and ?ins <- (object (is-a PERSON) (devicetype mobile))
	(object (is-a DEVICENAME) (price 15k-25k)))
	=> 
	(printout t crlf)
	(printout t "Let me select a Mobile Phone in range 15K - 25K..." crlf crlf)   	(send [client] put-company
   	(user-input-validation "What is your preferred company? (oneplus/samsung/xiaomi):  "
         oneplus samsung xiaomi)))
 
; RULE TO MOBILE ABOVE 25K
(defrule mob_above25k
	(and ?ins <- (object (is-a PERSON) (devicetype mobile))
	(object (is-a DEVICENAME) (price above25k)))
	=> 
	(printout t crlf)
	(printout t "Let me select a Mobile Phone above 25k..." crlf crlf) 
   	(send [client] put-company
   	(user-input-validation "What is your preferred company? (oneplus/samsung/apple):  "
         oneplus samsung apple)))
 
; RULE TO BUY MOBILE XIAOMI UNDER 10K
(defrule mob_xiaomi_under10k
	(and ?ins <- (object (is-a PERSON) (devicetype mobile) (company xiaomi))
	(object (is-a DEVICENAME) (price under10k)))
	=> 
	(send [which_device] put-suggested_device "Xiaomi Redmi 3S Prime (Rs.8999/-)"))

; RULE TO BUY MOBILE ASUS UNDER 10K
(defrule mob_asus_under10k
	(and ?ins <- (object (is-a PERSON) (devicetype mobile) (company asus))
	(object (is-a DEVICENAME) (price under10k)))
	=> 
	(send [which_device] put-suggested_device "Asus Zenfone Max (Rs.9500/-)"))

; RULE TO BUY MOBILE LENOVO UNDER 10K
(defrule mob_lenovo_under10k
	(and ?ins <- (object (is-a PERSON) (devicetype mobile) (company lenovo))
	(object (is-a DEVICENAME) (price under10k)))
	=> 
	(send [which_device] put-suggested_device "Lenovo Vibe K5 (Rs.6999/-)"))

; RULE TO BUY MOBILE LENOVO 10K-15K
(defrule mob_lenovo_10k15k
	(and ?ins <- (object (is-a PERSON) (devicetype mobile) (company lenovo))
	(object (is-a DEVICENAME) (price 10k-15k)))
	=> 
	(send [which_device] put-suggested_device "Lenovo K5 Note (Rs.11999/-)"))
	
; RULE TO BUY MOBILE MOTOROLA 10K-15K
(defrule mob_motorola_10k15k
	(and ?ins <- (object (is-a PERSON) (devicetype mobile) (company motorola))
	(object (is-a DEVICENAME) (price 10k-15k)))
	=> 
	(send [which_device] put-suggested_device "Moto G4 Plus (Rs. 13999/-)"))
	
; RULE TO BUY MOBILE SAMSUNG 10K-15K
(defrule mob_samsung_10k15k
	(and ?ins <- (object (is-a PERSON) (devicetype mobile) (company samsung))
	(object (is-a DEVICENAME) (price 10k-15k)))
	=> 
	(send [which_device] put-suggested_device "Samsung Galaxy J7 (Rs. 14990/-)"))

; RULE TO BUY MOBILE ONE PLUS 15K - 25K
(defrule mob_oneplus_15k25k
	(and ?ins <- (object (is-a PERSON) (devicetype mobile) (company oneplus))
	(object (is-a DEVICENAME) (price 15k-25k)))
	=> 
	(send [which_device] put-suggested_device "One Plus 2 (Rs. 19999/-)"))
	
; RULE TO BUY MOBILE SAMSUNG 15K - 25K
(defrule mob_samsung_15k25k 
	(and ?ins <- (object (is-a PERSON) (devicetype mobile) (company samsung))
	(object (is-a DEVICENAME) (price 15k-25k)))
	=> 
	(send [which_device] put-suggested_device "Samsung Galaxy J7 Prime (Rs. 18499/-)"))
	
; RULE TO BUY MOBILE  XIAOMI 15K - 25K
(defrule mob_xiaomi_15k25k  
	(and ?ins <- (object (is-a PERSON) (devicetype mobile) (company xiaomi))
	(object (is-a DEVICENAME) (price 15k-25k)))
	=> 
	(send [which_device] put-suggested_device "Xiaomi Mi5 (Rs. 22999/-)"))

; RULE TO BUY MOBILE ONE PLUS ABOVE 25K
(defrule mob_oneplus_above25k
	(and ?ins <- (object (is-a PERSON) (devicetype mobile) (company oneplus))
	(object (is-a DEVICENAME) (price above25k)))
	=> 
	(send [which_device] put-suggested_device "One Plus 3 (Rs. 27999/-)"))
	
; RULE TO BUY MOBILE SAMSUNG ABOVE 25K
(defrule mob_samsung_above25k
	(and ?ins <- (object (is-a PERSON) (devicetype mobile) (company samsung))
	(object (is-a DEVICENAME) (price above25k)))
	=> 
	(send [which_device] put-suggested_device "Samsung Galaxy S7 Edge (Rs. 50899/-)"))
	
; RULE TO BUY MOBILE APPLE ABOVE 25K
(defrule mob_lenovo_above25k
	(and ?ins <- (object (is-a PERSON) (devicetype mobile) (company apple))
	(object (is-a DEVICENAME) (price above25k)))
	=> 
	(send [which_device] put-suggested_device "Apple Iphone 6s (Rs. 41000/-)  OR  Apple Iphone 7 (Rs. 69999/-)"))
	
; RULE TO BUY TABLET UNDER 20K
(defrule tab_asus_under20k
	(and ?ins <- (object (is-a DEVICENAME) (price under20k) (company asus))
	(object(is-a PERSON)(devicetype tablet)))
	=> 
	(send ?ins put-suggested_device "Asus ZenPad 8 (Rs. 17999/-)") )

; RULE TO BUY APPLE TABLET ABOVE 20K
(defrule tab_apple_above20k
	(and ?ins <- (object (is-a PERSON) (devicetype tablet))
	(object (is-a DEVICENAME) (company apple)(price above20k)))
	=> 
	(send [which_device] put-suggested_device "Ipad Air 2 (Rs. 38999/-)  OR  Ipad Pro (Rs. 69999/-)"))
	
; RULE TO BUY SAMSUNG TABLET ABOVE 20K
(defrule tab_samsung_above20k
	(and ?ins <- (object (is-a PERSON) (devicetype tablet))
	(object (is-a DEVICENAME) (company samsung)(price above20k)))
	=> 
	(send [which_device] put-suggested_device "Samsung Galaxy Tab Pro (Rs. 48999/-)"))
	
; RULE TO BUY LENOVO TABLET ABOVE 20K
(defrule tab_lenovo_above20k
	(and ?ins <- (object (is-a PERSON) (devicetype tablet))
	(object (is-a DEVICENAME) (company lenovo)(price above20k)))
	=> 
	(send [which_device] put-suggested_device "Lenovo Yoga Tab 3 (Rs. 45999/-)"))
	
; RULE TO BUY XIAOMI PHABLET ABOVE 15K
(defrule phab_xiaomi_above15k
	(and ?ins <- (object (is-a DEVICENAME) (price above15k)(company xiaomi))
	(object (is-a PERSON) (devicetype phablet)))
	=> 
	(send ?ins put-suggested_device "Xiaomi Mi Max Prime (Rs. 19999/-)"))
	
; RULE TO BUY LENOVO PHABLET ABOVE 15K
(defrule phab_lenovo_above15k
	(and ?ins <- (object (is-a DEVICENAME) (price above15k)(company lenovo))
	(object (is-a PERSON) (devicetype phablet)))
	=> 
	(send ?ins put-suggested_device "Lenovo Phab 2 Plus (Rs. 15999/-)"))
	
; RULE TO BUY HUAWEI PHABLET ABOVE 15K
(defrule phab_huawei_above15k
	(and ?ins <- (object (is-a DEVICENAME) (price above15k)(company huawei))
	(object (is-a PERSON) (devicetype phablet)))
	=> 
	(send ?ins put-suggested_device "Huawei Mate 8 (Rs. 49999/-)"))
	
; RULE TO BUY PHABLET UNDER 15K
(defrule phab_under15k_micromax
	(and ?ins <- (object (is-a DEVICENAME) (price under15k)(company micromax))
	(object (is-a PERSON) (devicetype phablet)))
	=> 
	(send ?ins put-suggested_device "Micromax Canvas 5 E481 (Rs. 7699/-)")
	(printout t crlf)
	(printout t "Let me select a Phablet Under 15K..." crlf)) 
	
;----------------------------------------------------------------------------
; PRINTS THE FINAL SUGGESSION	
;----------------------------------------------------------------------------

; RULE TO PRINT THE SUGGESTED DEVICE
(defrule choose_device (declare (salience -1))
	(object (is-a DEVICENAME) (suggested_device ?mov))
	=>
	(printout t crlf)
	(printout t "-------------------------------------------------------------------------------------------------------------------------------" crlf)
    (printout t "The recommended Device which best suits your needs is: " ?mov crlf)
    (printout t "-------------------------------------------------------------------------------------------------------------------------------" crlf))