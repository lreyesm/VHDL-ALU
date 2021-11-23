----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.11.2021 23:54:41
-- Design Name: 
-- Module Name: top_layer - Behavioral
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

entity top_layer is
    Port ( 
        a_top       : IN std_logic_vector(3 downto 0);
        b_top       : IN std_logic_vector(3 downto 0);
        op_top      : IN std_logic_vector(1 downto 0);
        o_top       : OUT std_logic_vector(7 downto 0)
    );
end top_layer;

architecture Behavioral of top_layer is

    COMPONENT ALU_N_Bits is
        Port ( 
            a       : IN std_logic_vector(6 downto 0);
            b       : IN std_logic_vector(6 downto 0);
            op      : IN std_logic_vector(1 downto 0);
            o       : OUT std_logic_vector(7 downto 0)
        );
    END COMPONENT; 

    SIGNAL signal_a     : std_logic_vector(6 DOWNTO 0);
    SIGNAL signal_b     : std_logic_vector(6 DOWNTO 0);
    SIGNAL signal_opera : std_logic_vector(1 DOWNTO 0);
    SIGNAL signal_o     : std_logic_vector(7 DOWNTO 0);

begin
    xai: FOR i IN 0 TO 3 GENERATE   -- Inicialización a 0 de los m pin de la fila superior
        signal_a(i + 3) <= a_top(i);
    END GENERATE;
    xai2: FOR i IN 0 TO 2 GENERATE   -- Inicialización a 0 de los m pin de la fila superior
        signal_a(i) <= '0';
    END GENERATE;

    xbi: FOR i IN 0 TO 3 GENERATE   -- Inicialización a 0 de los m pin de la fila superior
        signal_b(i + 3) <= b_top(i);
    END GENERATE;
    xbi2: FOR i IN 0 TO 2 GENERATE   -- Inicialización a 0 de los m pin de la fila superior
        signal_b(i) <= '0';
    END GENERATE;

    U0: ALU_N_Bits PORT MAP
                (signal_a, signal_b, op_top, signal_o);

    o_top <= signal_o;
end Behavioral;
