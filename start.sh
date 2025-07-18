# Define o diretório de instalação como /root
INSTALL_DIR="/root/brln-os"

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
fi
