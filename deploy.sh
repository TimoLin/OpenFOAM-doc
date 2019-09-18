# Send make to backgroud
source ./OpenFOAM-2.3.x/etc/bashrc
cd OpenFOAM-2.3.x/doc

./Allwmake  &

# Constants
RED='\033[0;31m'
minutes=0
limit=30


while kill -0 $! >/dev/null 2>&1; do
  echo -n -e "- \b" 

  if [ $minutes == $limit ]; then
    echo -e "\n"
    echo -e "${RED}Test has reached a ${minutes} minutes timeout limit"
    exit 1
  fi

  minutes=$((minutes+1))

  sleep 60
done

exit 0
