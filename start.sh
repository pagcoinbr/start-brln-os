#!/bin/bash

cd /root

if [[ $? != 0 ]] then
echo "Login with root user using - sudo su"
else
echo " "
fi

# Define o diretório de instalação como /root
INSTALL_DIR="/root/brln-os"

# Remove diretório existente se houver
if [[ -d "$INSTALL_DIR" ]]; then
    echo "Removendo instalação anterior..."
    rm -rf "$INSTALL_DIR"
fi

# Clone repository
echo "Clonando repositório BRLN-OS..."
if git clone https://github.com/pagcoinbr/brln-os.git "$INSTALL_DIR" 2>&1; then
    echo "Repositório clonado com sucesso."
    bash "$INSTALL_DIR/run.sh"
else
    echo "Erro ao clonar o repositório BRLN-OS."
    exit 1
fi
