LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY control_full_block IS
    PORT (
        -- inputs
        INIT : in std_logic;
        MR3 : in std_logic;
        MR2 : in std_logic;
        MR1 : in std_logic;
        MR0 : in std_logic;
        CLK: in std_logic;
        RESET : in std_logic;  -- Sinal de reset
        
        -- outputs
        MDLD : out std_logic;
        MRLD : out std_logic;
        SCLOAD : out std_logic;
        SCCLEAR : out std_logic;
        SCSHR : out std_logic
    );
END control_full_block;

ARCHITECTURE Structural OF control_full_block IS

    -- Componentes
    COMPONENT control_block
        PORT (
            INIT : in std_logic;
            MR3 : in std_logic;
            MR2 : in std_logic;
            MR1 : in std_logic;
            MR0 : in std_logic;
            CLK: in std_logic;
            q0 : in std_logic;
            q1 : in std_logic;
            q2 : in std_logic;
            q3 : in std_logic;
            MDLD : out std_logic;
            MRLD : out std_logic;
            SCLOAD : out std_logic;
            SCCLEAR : out std_logic;
            SCSHR : out std_logic;
            qf0 : out std_logic;
            qf1 : out std_logic;
            qf2 : out std_logic;
            qf3 : out std_logic
        );
    END COMPONENT;

    COMPONENT reg4bit
        PORT (
            clk     : in  STD_LOGIC;
            reset   : in  STD_LOGIC;
            load    : in  STD_LOGIC;
            d       : in  STD_LOGIC_VECTOR(3 downto 0);
            q       : out STD_LOGIC_VECTOR(3 downto 0)
        );
    END COMPONENT;

    -- Sinais internos para conectar os componentes
    SIGNAL q0, q1, q2, q3 : std_logic;
    SIGNAL qf0, qf1, qf2, qf3 : std_logic;
    SIGNAL reg_out : std_logic_vector(3 downto 0); -- Saída do reg4bit

BEGIN

    -- Instancia do componente control_block
    u_control_block: control_block
        PORT MAP (
            INIT => INIT,
            MR3 => MR3,
            MR2 => MR2,
            MR1 => MR1,
            MR0 => MR0,
            CLK => CLK,
            q0 => q0,
            q1 => q1,
            q2 => q2,
            q3 => q3,
            MDLD => MDLD,
            MRLD => MRLD,
            SCLOAD => SCLOAD,
            SCCLEAR => SCCLEAR,
            SCSHR => SCSHR,
            qf0 => qf0,
            qf1 => qf1,
            qf2 => qf2,
            qf3 => qf3
        );

    -- Instancia do componente reg4bit
    u_reg4bit: reg4bit
        PORT MAP (
            clk => CLK,
            reset => RESET,
            load => '1', -- Assumindo que sempre queremos carregar o valor
            d => (qf3, qf2, qf1, qf0),
            q => reg_out
        );

    -- Conectar a saída do registrador às entradas do bloco de controle
    q0 <= reg_out(0);
    q1 <= reg_out(1);
    q2 <= reg_out(2);
    q3 <= reg_out(3);

END Structural;
