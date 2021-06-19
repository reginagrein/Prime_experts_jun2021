# Prime_experts_jun2021
Repositório para os códigos das aulas do Prime Experts junho/2021 realizado pela Prime Control!!!!

- como instalar o robot framework: pip install -U robotframework

- Como subir uma lateração no GithHub
    - 1º faz uma modificação no arquivo la no visual code 

    - 2º git add . (para adicionar as modificações)

    - 3º git commit -m "Uma mensagem explicativa" (para efetivar a alteração)
    
    - 4º git push

- Variáveis declaradas na seção *** Variables *** tem o escopo GLOBAL!

- Set Test Variable = faz com que todas as KWs do teste enxerguem a variável!

- Set Suite Variable = faz com que todas os testes da suíte enxerguem a variável!

- Set Global Variable = faz com que todas suítes da execução enxerguem a variável!

- Comando de execução: robot variables\teste_variaveis.robot


Mobile

adb shell am start -W -n com.myfixedpackage/.myfixedactivity.MainActivity -S -a android.intent.action.MAIN -c android.intent.category.LAUNCHER -f 0x10200000

•adb devices

•adb shell “dumpsys window windows | grep -E 'mCurrentFocus|mFocusedApp’”

•emulator @nome_do_device

•emulator –list-avds

- Chamar o teste 
    robot -d ./logs ./
