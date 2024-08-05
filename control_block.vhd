LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY control_block IS
	PORT
	(
		-- inputs
		INIT : in std_logic;
		MR3 : in std_logic;
		MR2 : in std_logic;
		MR1 : in std_logic;
		MR0 : in std_logic;
		CLK: in std_logic;
		
		-- states inputs
		q0 : in std_logic;
		q1 : in std_logic;
		q2 : in std_logic;
		q3 : in std_logic;
		
		-- outputs
		MDLD : out std_logic;
		MRLD : out std_logic;
		SCLOAD : out std_logic;
		SCCLEAR : out std_logic;
		SCSHR : out std_logic;
		
		-- states future inputs
		qf0 : out std_logic;
		qf1 : out std_logic;
		qf2 : out std_logic;
		qf3 : out std_logic	
	);
END control_block;


ARCHITECTURE func OF control_block IS
BEGIN
-- qf3 = q2 q1 ~mr2 + q2 q1 q0 + q3 ~q1
-- qf2 =	~q3 ~q2 q1 ~mr0 + ~q2 q1 q0 + q2 ~q1 + q2 ~q0 mr2
-- qf1 = ~q1 q0 + ~q3 ~q2 q1 ~q0 mr0 + q2 ~q1 ~mr1 + q2 q1 ~q0 mr2 + q3 ~q1 ~mr3
-- qf0 =	~q3 ~q2 ~q1 ~q0 iniciar + ~q3 ~q2 q1 ~q0 mr0 + q2 ~q1 ~q0 mr1 + q2 q1 ~q0 mr2 + q3 ~q1 ~q0 mr3
-- mdId =	~q3 ~q2 ~q1 q0
-- mrId =	~q3 ~q2 ~q1 q0
-- scload =	q1 q0 + q2 q0 + q3 q0
-- scclear = ~q3 ~q2 ~q1 q0
-- scshr =	q2 ~q0 + q3 ~q0

combinational: process(INIT, MR3, MR2, MR1, MR0, q0, q1, q2, q3)
begin
	 qf3 <= (q2 AND q1 AND NOT MR2) OR
           (q2 AND q1 AND q0) OR
           (q3 AND NOT q1);

    qf2 <= (NOT q3 AND NOT q2 AND q1 AND NOT MR0) OR
           (NOT q2 AND q1 AND q0) OR
           (q2 AND NOT q1) OR
           (q2 AND NOT q0 AND MR2);

    qf1 <= (NOT q1 AND q0) OR
           (NOT q3 AND NOT q2 AND q1 AND NOT q0 AND MR0) OR
           (q2 AND NOT q1 AND NOT MR1) OR
           (q2 AND q1 AND NOT q0 AND MR2) OR
           (q3 AND NOT q1 AND NOT MR3);

    qf0 <= (NOT q3 AND NOT q2 AND NOT q1 AND NOT q0 AND INIT) OR
           (NOT q3 AND NOT q2 AND q1 AND NOT q0 AND MR0) OR
           (q2 AND NOT q1 AND NOT q0 AND MR1) OR
           (q2 AND q1 AND NOT q0 AND MR2) OR
           (q3 AND NOT q1 AND NOT q0 AND MR3);

    MDLD <= (NOT q3 AND NOT q2 AND NOT q1 AND q0);

    MRLD <= (NOT q3 AND NOT q2 AND NOT q1 AND q0);

    SCLOAD <= (q1 AND q0) OR
               (q2 AND q0) OR
               (q3 AND q0);

    SCCLEAR <= (NOT q3 AND NOT q2 AND NOT q1 AND q0);

    SCSHR <= (q2 AND NOT q0) OR
             (q3 AND NOT q0);
end process combinational;

END func;