----------------------------------------------------------------------------------
-- Company: UPV / EHU
-- Engineers: Luis Alejandro Reyes Morales 
-- Adrian Nieves de la Cruz
-- 
-- Create Date: 19.10.2021 19:31:26
-- Design Name: 
-- Module Name: ALU_tb - Behavioral
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

-- MASTER SIEAV. Curso 2019-2020 
-- Modelo de fichero de simulaci�n 


-- *************************** Entity name ********************************* 
ENTITY Nombre_Entidad_testbench IS 
END Nombre_Entidad_testbench; 
-- ************************************************************************* 

ARCHITECTURE behavioral OF Nombre_Entidad_testbench IS  
    
    -- COMPONENT ALU is
    --     Port ( 
    --         ai          : IN std_logic;
    --         bi          : IN std_logic;
    --         cin         : IN std_logic;
    --         signo       : IN std_logic;
    --         opera       : IN std_logic_vector(1 downto 0);
    --         cout        : OUT std_logic;
    --         result      : OUT std_logic
    --     );
    -- END COMPONENT;  
    
    COMPONENT ALU_N_Bits is
        Port ( 
            a       : IN std_logic_vector(6 downto 0);
            b       : IN std_logic_vector(6 downto 0);
            op      : IN std_logic_vector(1 downto 0);
            o       : OUT std_logic_vector(7 downto 0)
        );
    END COMPONENT; 
    
    -- SIGNAL signal_ai_net: STD_LOGIC; 
    -- SIGNAL signal_bi_net: STD_LOGIC; 
    -- SIGNAL signal_cin_net: STD_LOGIC; 
    -- SIGNAL signal_signo_net: STD_LOGIC; 
    -- SIGNAL signal_opera_net: std_logic_vector(1 downto 0); 
    -- SIGNAL signal_cout_net: STD_LOGIC; 
    -- SIGNAL signal_result_net: STD_LOGIC; 
    
    SIGNAL signal_a_net: std_logic_vector(6 downto 0); 
    SIGNAL signal_b_net: std_logic_vector(6 downto 0); 
    SIGNAL signal_op_net: std_logic_vector(1 downto 0); 
    SIGNAL signal_o_net: std_logic_vector(7 downto 0); 

BEGIN 

-- UUT: ALU  
UUT: ALU_N_Bits
-- ****************************** MAPPING *******************************
-- PORT MAP(   ai => signal_ai_net, 
--             bi => signal_bi_net, 
--             cin => signal_cin_net,
--             signo => signal_signo_net,
--             opera => signal_opera_net,
--             cout => signal_cout_net,
--             result => signal_result_net
--         ); 
PORT MAP(   a   => signal_a_net, 
            b   => signal_b_net, 
            op  => signal_op_net, 
            o   => signal_o_net
        ); 
-- ********************************************************************** 

-- ****************************** PROCESS *******************************
Testbench_Desc_Name: PROCESS 
    BEGIN  
        signal_op_net <= "01"; 
        signal_a_net <= "1000011"; 
        signal_b_net <= "1010001"; 
        WAIT FOR 250 NS; 

        signal_op_net <= "01"; 
        signal_a_net <= "0000011"; 
        signal_b_net <= "0000011"; 
        WAIT FOR 250 NS; 

        
        signal_op_net <= "01"; 
        signal_a_net <= "1111111"; 
        signal_b_net <= "1100000"; 
        WAIT FOR 250 NS; 
        
        signal_op_net <= "01"; 
        signal_a_net <= "1000001"; 
        signal_b_net <= "0011001"; 
        WAIT FOR 250 NS;

        WAIT;  
    END PROCESS; 
END; 
-- Testbench_Desc_Name: PROCESS 
--     BEGIN  
--         signal_ai_net <= '1'; 
--         signal_bi_net <= '0'; 
--         signal_cin_net <= '0'; 
--         signal_signo_net <= '0';
--         signal_opera_net <= "01"; 
--         WAIT FOR 250 NS; 

--         signal_ai_net <= '1'; 
--         signal_bi_net <= '1'; 
--         signal_cin_net <= '0';
--         signal_signo_net <= '0';
--         signal_opera_net <= "01";
--         WAIT FOR 250 NS; 

        
--         signal_ai_net <= '0'; 
--         signal_bi_net <= '1'; 
--         signal_cin_net <= '0';
--         signal_signo_net <= '0';
--         signal_opera_net <= "11";
--         WAIT FOR 250 NS; 
        
--         signal_ai_net <= '0'; 
--         signal_bi_net <= '0'; 
--         signal_cin_net <= '0';
--         signal_signo_net <= '0';
--         signal_opera_net <= "00";
--         WAIT FOR 250 NS;

--         WAIT;  
--     END PROCESS; 
-- END; 
-- ******************************************************************