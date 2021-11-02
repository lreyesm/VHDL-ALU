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
    a       : IN std_logic_vector(6 downto 0);
    b       : IN std_logic_vector(6 downto 0)
  );
end ALU_N_Bits;

architecture Behavioral of ALU_N_Bits is

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
    
begin
    Inst_ALU: ALU PORT MAP(
        ai          => ,
        bi          => ,
        cin         => ,
        signo       => ,
        opera       => ,
        cout        => ,
        result      => 
    )

end Behavioral;
