{-# OPTIONS_GHC -w #-}
module SLParse   where

-- import Alex

import SLLex
import SLTokens
import Control.Applicative(Applicative(..))

-- parser produced by Happy Version 1.19.4

data HappyAbsSyn 
	= HappyTerminal ((Token AlexPosn))
	| HappyErrorToken Int
	| HappyAbsSyn5 (())

{- to allow type-synonyms as our monads (likely
 - with explicitly-specified bind and return)
 - in Haskell98, it seems that with
 - /type M a = .../, then /(HappyReduction M)/
 - is not allowed.  But Happy is a
 - code-generator that can just substitute it.
type HappyReduction m = 
	   Int 
	-> ((Token AlexPosn))
	-> HappyState ((Token AlexPosn)) (HappyStk HappyAbsSyn -> [((Token AlexPosn))] -> m HappyAbsSyn)
	-> [HappyState ((Token AlexPosn)) (HappyStk HappyAbsSyn -> [((Token AlexPosn))] -> m HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [((Token AlexPosn))] -> m HappyAbsSyn
-}

action_0,
 action_1,
 action_2,
 action_3,
 action_4,
 action_5,
 action_6,
 action_7,
 action_8,
 action_9,
 action_10,
 action_11,
 action_12,
 action_13,
 action_14,
 action_15,
 action_16,
 action_17,
 action_18,
 action_19,
 action_20,
 action_21,
 action_22,
 action_23,
 action_24,
 action_25,
 action_26,
 action_27,
 action_28,
 action_29,
 action_30,
 action_31,
 action_32 :: () => Int -> ({-HappyReduction (HappyIdentity) = -}
	   Int 
	-> ((Token AlexPosn))
	-> HappyState ((Token AlexPosn)) (HappyStk HappyAbsSyn -> [((Token AlexPosn))] -> (HappyIdentity) HappyAbsSyn)
	-> [HappyState ((Token AlexPosn)) (HappyStk HappyAbsSyn -> [((Token AlexPosn))] -> (HappyIdentity) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [((Token AlexPosn))] -> (HappyIdentity) HappyAbsSyn)

happyReduce_2,
 happyReduce_3,
 happyReduce_4,
 happyReduce_5,
 happyReduce_6,
 happyReduce_7,
 happyReduce_8,
 happyReduce_9,
 happyReduce_10,
 happyReduce_11,
 happyReduce_12,
 happyReduce_13 :: () => ({-HappyReduction (HappyIdentity) = -}
	   Int 
	-> ((Token AlexPosn))
	-> HappyState ((Token AlexPosn)) (HappyStk HappyAbsSyn -> [((Token AlexPosn))] -> (HappyIdentity) HappyAbsSyn)
	-> [HappyState ((Token AlexPosn)) (HappyStk HappyAbsSyn -> [((Token AlexPosn))] -> (HappyIdentity) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [((Token AlexPosn))] -> (HappyIdentity) HappyAbsSyn)

action_0 (10) = happyShift action_4
action_0 (19) = happyShift action_5
action_0 (5) = happyGoto action_7
action_0 _ = happyFail

action_1 (10) = happyShift action_4
action_1 (19) = happyShift action_5
action_1 (5) = happyGoto action_6
action_1 _ = happyFail

action_2 (10) = happyShift action_4
action_2 (19) = happyShift action_5
action_2 (5) = happyGoto action_3
action_2 _ = happyFail

action_3 (17) = happyShift action_8
action_3 _ = happyFail

action_4 (8) = happyShift action_10
action_4 _ = happyFail

action_5 (11) = happyShift action_9
action_5 _ = happyFail

action_6 (17) = happyShift action_8
action_6 (20) = happyAccept
action_6 _ = happyFail

action_7 (17) = happyShift action_8
action_7 (20) = happyAccept
action_7 _ = happyFail

action_8 (10) = happyShift action_4
action_8 (19) = happyShift action_5
action_8 (5) = happyGoto action_17
action_8 _ = happyFail

action_9 (8) = happyShift action_13
action_9 (18) = happyShift action_14
action_9 (19) = happyShift action_15
action_9 (6) = happyGoto action_16
action_9 _ = happyFail

action_10 (8) = happyShift action_13
action_10 (18) = happyShift action_14
action_10 (19) = happyShift action_15
action_10 (6) = happyGoto action_11
action_10 (7) = happyGoto action_12
action_10 _ = happyFail

action_11 (12) = happyShift action_18
action_11 (13) = happyShift action_19
action_11 (14) = happyShift action_20
action_11 (15) = happyShift action_21
action_11 (16) = happyShift action_24
action_11 _ = happyReduce_12

action_12 (9) = happyShift action_23
action_12 _ = happyFail

action_13 (10) = happyShift action_4
action_13 (19) = happyShift action_5
action_13 (5) = happyGoto action_22
action_13 _ = happyFail

action_14 _ = happyReduce_6

action_15 _ = happyReduce_5

action_16 (12) = happyShift action_18
action_16 (13) = happyShift action_19
action_16 (14) = happyShift action_20
action_16 (15) = happyShift action_21
action_16 _ = happyReduce_3

action_17 (17) = happyShift action_8
action_17 _ = happyReduce_2

action_18 (8) = happyShift action_13
action_18 (18) = happyShift action_14
action_18 (19) = happyShift action_15
action_18 (6) = happyGoto action_30
action_18 _ = happyFail

action_19 (8) = happyShift action_13
action_19 (18) = happyShift action_14
action_19 (19) = happyShift action_15
action_19 (6) = happyGoto action_29
action_19 _ = happyFail

action_20 (8) = happyShift action_13
action_20 (18) = happyShift action_14
action_20 (19) = happyShift action_15
action_20 (6) = happyGoto action_28
action_20 _ = happyFail

action_21 (8) = happyShift action_13
action_21 (18) = happyShift action_14
action_21 (19) = happyShift action_15
action_21 (6) = happyGoto action_27
action_21 _ = happyFail

action_22 (16) = happyShift action_26
action_22 (17) = happyShift action_8
action_22 _ = happyFail

action_23 _ = happyReduce_4

action_24 (8) = happyShift action_13
action_24 (18) = happyShift action_14
action_24 (19) = happyShift action_15
action_24 (6) = happyGoto action_11
action_24 (7) = happyGoto action_25
action_24 _ = happyFail

action_25 _ = happyReduce_13

action_26 (8) = happyShift action_13
action_26 (18) = happyShift action_14
action_26 (19) = happyShift action_15
action_26 (6) = happyGoto action_31
action_26 _ = happyFail

action_27 _ = happyReduce_10

action_28 _ = happyReduce_9

action_29 (14) = happyShift action_20
action_29 (15) = happyShift action_21
action_29 _ = happyReduce_8

action_30 (14) = happyShift action_20
action_30 (15) = happyShift action_21
action_30 _ = happyReduce_7

action_31 (9) = happyShift action_32
action_31 (12) = happyShift action_18
action_31 (13) = happyShift action_19
action_31 (14) = happyShift action_20
action_31 (15) = happyShift action_21
action_31 _ = happyFail

action_32 _ = happyReduce_11

happyReduce_2 = happySpecReduce_3  5 happyReduction_2
happyReduction_2 _
	_
	_
	 =  HappyAbsSyn5
		 (
	)

happyReduce_3 = happySpecReduce_3  5 happyReduction_3
happyReduction_3 _
	_
	_
	 =  HappyAbsSyn5
		 (
	)

happyReduce_4 = happyReduce 4 5 happyReduction_4
happyReduction_4 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (
	) `HappyStk` happyRest

happyReduce_5 = happySpecReduce_1  6 happyReduction_5
happyReduction_5 _
	 =  HappyAbsSyn5
		 (
	)

happyReduce_6 = happySpecReduce_1  6 happyReduction_6
happyReduction_6 _
	 =  HappyAbsSyn5
		 (
	)

happyReduce_7 = happySpecReduce_3  6 happyReduction_7
happyReduction_7 _
	_
	_
	 =  HappyAbsSyn5
		 (
	)

happyReduce_8 = happySpecReduce_3  6 happyReduction_8
happyReduction_8 _
	_
	_
	 =  HappyAbsSyn5
		 (
	)

happyReduce_9 = happySpecReduce_3  6 happyReduction_9
happyReduction_9 _
	_
	_
	 =  HappyAbsSyn5
		 (
	)

happyReduce_10 = happySpecReduce_3  6 happyReduction_10
happyReduction_10 _
	_
	_
	 =  HappyAbsSyn5
		 (
	)

happyReduce_11 = happyReduce 5 6 happyReduction_11
happyReduction_11 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_1  7 happyReduction_12
happyReduction_12 _
	 =  HappyAbsSyn5
		 (
	)

happyReduce_13 = happySpecReduce_3  7 happyReduction_13
happyReduction_13 _
	_
	_
	 =  HappyAbsSyn5
		 (
	)

happyNewToken action sts stk [] =
	action 20 20 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	LPar _ -> cont 8;
	RPar _ -> cont 9;
	Print _ -> cont 10;
	Assign _ -> cont 11;
	SLTokens.OpPlus _ -> cont 12;
	SLTokens.OpMinus _ -> cont 13;
	SLTokens.OpTimes _ -> cont 14;
	SLTokens.OpDivide _ -> cont 15;
	Comma _ -> cont 16;
	Semicol _ -> cont 17;
	IVal happy_dollar_dollar _ -> cont 18;
	Id happy_dollar_dollar _ -> cont 19;
	_ -> happyError' (tk:tks)
	}

happyError_ 20 tk tks = happyError' tks
happyError_ _ tk tks = happyError' (tk:tks)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure    = return
    a <*> b = (fmap id a) <*> b
instance Monad HappyIdentity where
    return = HappyIdentity
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => [((Token AlexPosn))] -> HappyIdentity a
happyError' = HappyIdentity . happyError

parse tks = happyRunIdentity happySomeParser where
  happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn5 z -> happyReturn z; _other -> notHappyAtAll })

parse tks = happyRunIdentity happySomeParser where
  happySomeParser = happyThen (happyParse action_1 tks) (\x -> case x of {HappyAbsSyn5 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


happyError :: [Token AlexPosn] -> a
happyError tks = error ("Parse error at " ++ lcn ++ "\n")
	where
	lcn = 	case tks of
		  [] -> "end of file"
		  (tk:_) -> "line " ++ show l ++ ", column " ++ show c ++ " (token " ++ filterPn (show tk) ++ ")"
			where AlexPn _ l c = token_pos tk
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<command-line>" #-}





# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4










































{-# LINE 5 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 13 "templates/GenericTemplate.hs" #-}

{-# LINE 46 "templates/GenericTemplate.hs" #-}








{-# LINE 67 "templates/GenericTemplate.hs" #-}

{-# LINE 77 "templates/GenericTemplate.hs" #-}

{-# LINE 86 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 155 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 256 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 322 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
