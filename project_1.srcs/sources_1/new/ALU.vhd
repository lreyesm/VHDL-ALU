----------------------------------------------------------------------------------
-- Company: 
-- Engineers: Luis Alejandro Reyes Morales 
-- Adrian Nieves de la Cruz
--
-- Create Date: 19.10.2021 18:28:16
-- Design Name: 
-- Module Name: ALU - Circuit
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

entity ALU is
    Port ( 
        ai          : IN std_logic;
        bi          : IN std_logic;
        cin         : IN std_logic;
        signo       : IN std_logic;
        opera       : IN std_logic_vector(1 downto 0);
        cout        : OUT std_logic;
        result      : OUT std_logic
    );
end ALU;

architecture Circuit of ALU is

begin
    PROCESS (ai, bi, cin, signo, opera)
    BEGIN

        if opera="00" then 
            result <= (ai XOR bi) XOR cin;
            if (ai and bi)='1' then
                cout <= '1';
            elsif (ai and cin)='1' then
                cout <= '1';
            elsif (bi and cin)='1' then
                cout <= '1';
            else
                cout <= '0';
            end if;

        elsif opera="01" then
            if cin='1' then
                if (ai XOR (not bi))='1' then
                    result <= '0';
                    cout <= '0';
                else
                    result <= '1';
                    cout <= '1';
                end if; 
            else 
                result <= ai XOR (not bi);
                if (ai < bi) then
                    cout <= '1';
                else 
                    cout <= '0';
                end if;              
            end if;

        elsif opera="10" then
            result <= ai OR (not bi);

        elsif opera="11" then
            result <= ai OR (not bi);
        end if;

    END PROCESS;
end Circuit;
