library ieee;
use ieee.std_logic_1164.all;
use work.all;

entity somador is
    port(
        -- entradas do multiplicando
        m3 : in std_logic;
        m2 : in std_logic;
        m1 : in std_logic;
        m0 : in std_logic;
        
        -- entradas do multiplicador
        a3 : in std_logic;
        a2 : in std_logic;
        a1 : in std_logic;
        a0 : in std_logic;
        
        -- botão para iniciar a soma
        init : in std_logic;
        
        -- sinal de clock
        clk: in std_logic;
        
        -- resultado da soma
        p : out std_logic_vector(7 downto 0);
        
        -- segmentos do display
        segments_1 : out std_logic_vector(6 downto 0);
        segments_2 : out std_logic_vector(6 downto 0);
        
        -- habilitação dos displays
        display_1 : out std_logic;
        display_2 : out std_logic
    );
end somador;

architecture struct of somador is
    -- Componentes
    component reg4bit
        port (
            clk     : in  std_logic;
            reset   : in  std_logic;
            load    : in  std_logic;
            d       : in  std_logic_vector(3 downto 0);
            q       : out std_logic_vector(3 downto 0)
        );
    end component;

    component control_full_block
        port (
            INIT : in std_logic;
            MR3 : in std_logic;
            MR2 : in std_logic;
            MR1 : in std_logic;
            MR0 : in std_logic;
            CLK: in std_logic;
            RESET : in std_logic;
            MDLD : out std_logic;
            MRLD : out std_logic;
            SCLOAD : out std_logic;
            SCCLEAR : out std_logic;
            SCSHR : out std_logic
        );
    end component;

    component adder4bit
        port (
            a       : in  std_logic_vector(3 downto 0);
            b       : in  std_logic_vector(3 downto 0);
            cin     : in  std_logic;
            sum     : out std_logic_vector(3 downto 0);
            cout    : out std_logic
        );
    end component;

    component shift_register_8bit
        port (
            clk         : in  std_logic;
            reset       : in  std_logic;
            load        : in  std_logic;
            shift_right : in  std_logic;
            clear       : in  std_logic;
            data_in     : in  std_logic_vector(7 downto 0);
            data_out    : out std_logic_vector(7 downto 0)
        );
    end component;

    component seven_segment_decoder
        port (
            binary_in : in  std_logic_vector(7 downto 0); -- Entrada de 8 bits
            segments_1 : out std_logic_vector(6 downto 0); -- Segmentos do primeiro display
            segments_2 : out std_logic_vector(6 downto 0)  -- Segmentos do segundo display
        );
    end component;

    -- Sinais internos
    signal mr : std_logic_vector(3 downto 0); -- Saída do registrador para multiplicador
    signal md : std_logic_vector(3 downto 0); -- Saída do registrador para multiplicando
    signal sum_out : std_logic_vector(3 downto 0); -- Saída da soma
    signal cout : std_logic; -- Carry-out da soma
    signal shift_reg_out : std_logic_vector(7 downto 0); -- Saída do shift_register_8bit
    signal combined_data_in : std_logic_vector(7 downto 0); -- Dados de entrada combinados para o shift_register_8bit

    -- Sinais do control_full_block
    signal MDLD, MRLD, SCLOAD, SCCLEAR, SCSHR : std_logic;

begin

    -- Instância do componente control_full_block
    u_control_full_block: control_full_block
        port map (
            INIT => init,
            MR3 => mr(3),
            MR2 => mr(2),
            MR1 => mr(1),
            MR0 => mr(0),
            CLK => clk,
            RESET => '0',
            MDLD => MDLD,
            MRLD => MRLD,
            SCLOAD => SCLOAD,
            SCCLEAR => SCCLEAR,
            SCSHR => SCSHR
        );

    -- Instância do componente reg4bit para o multiplicador
    u_reg4bit_mult: reg4bit
        port map (
            clk => clk,
            reset => '0',
            load => MRLD,
            d => (a3, a2, a1, a0),
            q => mr
        );

    -- Instância do componente reg4bit para o multiplicando
    u_reg4bit_multip: reg4bit
        port map (
            clk => clk,
            reset => '0',
            load => MDLD,
            d => (m3, m2, m1, m0),
            q => md
        );

    -- Instância do componente shift_register_8bit
    u_shift_register_8bit: shift_register_8bit
        port map (
            clk => clk,
            reset => '0',
            load => SCLOAD, -- Conectado à saída SCLOAD do control_block
            shift_right => SCSHR, -- Conectado à saída SCSHR do control_block
            clear => SCCLEAR, -- Conectado à saída SCCLEAR do control_block
            data_in => combined_data_in,
            data_out => shift_reg_out
        );

    -- Instância do componente adder4bit
    u_adder4bit: adder4bit
        port map (
            a => shift_reg_out(7 downto 4), -- 4 bits mais significativos do shift_register_8bit
            b => md, -- Saída do reg4bit para multiplicando
            cin => '0', -- Sem carry-in inicial
            sum => sum_out,
            cout => cout
        );

    -- Conectar os 4 primeiros bits da saída do shift_register_8bit ao registrador de entrada
    combined_data_in <= sum_out & shift_reg_out(3 downto 0);

    -- Conectar a saída do shift_register_8bit ao porto de saída p
    p <= shift_reg_out;

    -- Instância do decodificador de 7 segmentos
    u_seven_segment_decoder: seven_segment_decoder
        port map (
            binary_in => shift_reg_out, -- Conectar a saída do shift_register_8bit
            segments_1 => segments_1,
            segments_2 => segments_2
        );

    -- Habilitação dos displays
    display_1 <= '1';
    display_2 <= '1';

end struct;
