library ieee;
use ieee.std_logic_1164.all;

entity seven_segment_decoder is
    port (
        binary_in : in  std_logic_vector(7 downto 0); -- Entrada de 8 bits
        segments_1 : out std_logic_vector(6 downto 0); -- Segmentos do primeiro display
        segments_2 : out std_logic_vector(6 downto 0)  -- Segmentos do segundo display
    );
end seven_segment_decoder;

architecture Behavioral of seven_segment_decoder is
begin
    process(binary_in)
    begin
        -- Decodificação dos 4 bits menos significativos (LSB)
        case binary_in(3 downto 0) is
            when "0000" => segments_1 <= "1111110"; -- 0
            when "0001" => segments_1 <= "0110000"; -- 1
            when "0010" => segments_1 <= "1101101"; -- 2
            when "0011" => segments_1 <= "1111001"; -- 3
            when "0100" => segments_1 <= "0110011"; -- 4
            when "0101" => segments_1 <= "1011011"; -- 5
            when "0110" => segments_1 <= "1011111"; -- 6
            when "0111" => segments_1 <= "1110000"; -- 7
            when "1000" => segments_1 <= "1111111"; -- 8
            when "1001" => segments_1 <= "1111011"; -- 9
            when others => segments_1 <= "0000000"; -- Off
        end case;

        -- Decodificação dos 4 bits mais significativos (MSB)
        case binary_in(7 downto 4) is
            when "0000" => segments_2 <= "1111110"; -- 0
            when "0001" => segments_2 <= "0110000"; -- 1
            when "0010" => segments_2 <= "1101101"; -- 2
            when "0011" => segments_2 <= "1111001"; -- 3
            when "0100" => segments_2 <= "0110011"; -- 4
            when "0101" => segments_2 <= "1011011"; -- 5
            when "0110" => segments_2 <= "1011111"; -- 6
            when "0111" => segments_2 <= "1110000"; -- 7
            when "1000" => segments_2 <= "1111111"; -- 8
            when "1001" => segments_2 <= "1111011"; -- 9
            when others => segments_2 <= "0000000"; -- Off
        end case;
    end process;
end Behavioral;
