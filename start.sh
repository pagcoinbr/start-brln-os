#!/bin/bash

# Define o diretório de instalação como /root
INSTALL_DIR="/root/brln-os"

# Function to display error messages
error() {
    echo "ERRO: $1" >&2
}

# Clone repository if it doesn't exist
if [[ ! -d "$INSTALL_DIR" ]]; then
    echo "Clonando repositório BRLN-OS..."
    if git clone https://github.com/pagcoinbr/brln-os.git "$INSTALL_DIR" 2>&1; then
        echo "Repositório clonado com sucesso."
        sudo -u root bash /root/brln-os/run.sh
    else
        echo "Erro ao clonar o repositório BRLN-OS."
        exit 1
    fi
else
    echo "Repositório já existe em $INSTALL_DIR"
    # Change to the installation directory
    cd "$INSTALL_DIR" || {
        error "Não foi possível acessar o diretório $INSTALL_DIR"
        exit 1
    }
    
    # Verificar se estamos no diretório correto
    if [[ ! -d "container" ]]; then
        error "Diretório 'container' não encontrado!"
        error "Execute este script no diretório raiz do projeto brln-os"
        echo ""
        echo "Exemplo:"
        echo "  git clone https://github.com/pagcoinbr/brln-os.git"
        echo "  cd brln-os"
        echo "  ./run.sh"
        exit 1
    fi
    
    # Execute the main script
    sudo -u root bash /root/brln-os/run.sh
fi
