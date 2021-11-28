----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.11.2021 19:28:10
-- Design Name: 
-- Module Name: ALU_N_Bits - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU_N_Bits is
    Port ( 
        a       : IN std_logic_vector(3 downto 0);
        b       : IN std_logic_vector(3 downto 0);
        op      : IN std_logic_vector(1 downto 0);
        o       : OUT std_logic_vector(7 downto 0)
    );
end ALU_N_Bits;

architecture bloque of ALU_N_Bits is

    COMPONENT ALU is
        Port ( 
            ai          : IN std_logic;
            bi          : IN std_logic;
            cin         : IN std_logic;
            signo       : IN std_logic;
            opera       : IN std_logic_vector(1 downto 0);
            cout        : OUT std_logic;
            result      : OUT std_logic
        );
    END COMPONENT; 

    SIGNAL ai           : std_logic_vector(6 DOWNTO 0);
    SIGNAL bi           : std_logic_vector(6 DOWNTO 0);
    SIGNAL cini         : std_logic_vector(6 DOWNTO 0);
    SIGNAL signoi       : std_logic;-- Vector de n bit
    SIGNAL operai       : std_logic_vector(1 DOWNTO 0);
    SIGNAL couti        : std_logic_vector(6 DOWNTO 0);
    SIGNAL resulti      : std_logic_vector(6 DOWNTO 0);

begin
    xai: FOR i IN 0 TO 6 GENERATE   
        ai(i) <= a(i);
    END GENERATE;    
    xbi: FOR i IN 0 TO 6 GENERATE   
        bi(i) <= b(i);
    END GENERATE;    
    xcini: FOR i IN 0 TO 6 GENERATE   
        cini(i) <='0';
    END GENERATE;
    xsignoi: FOR i IN 0 TO 6 GENERATE   
        signoi <= '1' when (a >= b) else '0';
    END GENERATE;
    xoperai: FOR i IN 0 TO 1 GENERATE   
        operai(i) <= op(i);
    END GENERATE;


    ALUs: FOR i IN 0 TO 7 GENERATE

        firstUnit: IF (i=0) GENERATE
        -- Generación de los elementos de la columna superior
            U0: ALU PORT MAP
                (ai(i), bi(i), '0', signoi, operai, couti(i), resulti(i));
        END GENERATE;

        otherUnitsI: IF (i>0 and i<7 ) GENERATE
            UI: ALU PORT MAP 
                (ai(i), bi(i), couti(i - 1), signoi, operai, couti(i), resulti(i));
        END GENERATE;

    END GENERATE;

    o <= (((couti(6) AND (not operai(0))) OR ((not signoi) AND operai(0))) AND (not operai(1))) & resulti;

end bloque;
