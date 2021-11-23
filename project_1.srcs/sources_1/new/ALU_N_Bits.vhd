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

    -- TYPE matriz IS ARRAY(0 TO 1, 0 TO 1) OF BIT;

    -- SIGNAL a, b : matriz;                   -- Matrices que contendrán los resultados de los bloques de 1 bit
    SIGNAL ai           : std_logic_vector(6 DOWNTO 0); -- Vector de m bits para contener los pin de la fila superior
    SIGNAL bi           : std_logic_vector(6 DOWNTO 0); -- Vector de m bits para contener los pin de la fila superior
    SIGNAL cini         : std_logic_vector(6 DOWNTO 0); -- Vector de n bits para contener los cin de la columna derecha
    SIGNAL signoi       : std_logic; -- Vector de n bits para contener los cin de la columna derecha
    SIGNAL operai       : std_logic_vector(1 DOWNTO 0); -- Vector de n bits para contener los cin de la columna derecha
    SIGNAL couti        : std_logic_vector(6 DOWNTO 0); -- Vector de n bits para contener los cin de la columna derecha
    SIGNAL resulti      : std_logic_vector(6 DOWNTO 0); -- Vector de n bits para contener los cin de la columna derecha

begin
    xai: FOR i IN 0 TO 3 GENERATE   -- Inicialización a 0 de los m pin de la fila superior
        ai(i + 3) <= a(i);
    END GENERATE;
    xai2: FOR i IN 0 TO 2 GENERATE   -- Inicialización a 0 de los m pin de la fila superior
        ai(i) <= '0';
    END GENERATE;
    
    xbi: FOR i IN 0 TO 3 GENERATE   -- Inicialización a 0 de los m pin de la fila superior
        bi(i + 3) <= b(i);
    END GENERATE;
    xbi2: FOR i IN 0 TO 2 GENERATE   -- Inicialización a 0 de los m pin de la fila superior
        bi(i) <= '0';
    END GENERATE;
    
    xcini: FOR i IN 0 TO 6 GENERATE   -- Inicialización a 0 de los m pin de la fila superior
        cini(i) <='0';
    END GENERATE;
    xsignoi: FOR i IN 0 TO 6 GENERATE   -- Inicialización a 0 de los m pin de la fila superior
        signoi <= '1' when (a >= b) else '0';
    END GENERATE;
    xoperai: FOR i IN 0 TO 1 GENERATE   -- Inicialización a 0 de los m pin de la fila superior
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
