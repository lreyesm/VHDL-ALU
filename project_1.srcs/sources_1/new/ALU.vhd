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
            result <= (ai XOR bi) XOR cin;
            if (((not ai) and bi) OR cin)='1' then
                cout <= '1';
            else
                cout <= '0';
            end if;

        elsif opera="10" then
            cout <= '0';
            if signo='1' then
                result <= ai;
            else
                result <= bi;
            end if;
                

        elsif opera="11" then
            cout <= '0';
            if signo='1' then
                result <= bi;
            else
                result <= ai;
            end if;
            
        else
            cout <= '0';
            result <= '0';
        end if;

    END PROCESS;
end Circuit;
