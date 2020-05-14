*** Settings ***
Documentation          HIG MQTT CLi connection & tests
...                    and getting its output.
...
...                    Notice how connections are handled as part of the suite setup and
...                    teardown. This saves some time when executing several test cases.

Library                SSHLibrary
Suite Setup            Open Connection And Log In
Suite Teardown         Close All Connections
Resource                resource.robot

*** Test Cases ***
Hello World
    [Tags]    DEBUG
    [Documentation]  Hello world to connect to MQTT
    ${go to data directory up by 1 level}=      write     cd ..
    ${go to data directory up by 2 levels}=      write     cd ..
    ${go to data directory}=      write     cd data
    ${path should exist}=       read command output

Device.DeviceInfo.X_TMOBILE_MACAddress
    [Tags]  Device.DeviceInfo.X_TMOBILE_MACAddress
    [Documentation]  Device.DeviceInfo.X_TMOBILE_MACAddress
    write       uci_restful -r /restful/sysadm/device_info GET
    set client configuration  prompt=#
    ${output}=         read Until prompt
    should not contain  ${output}   fail

Device.DeviceInfo.X_TMOBILE_GlobalIPAddress
    [Tags]  Device.DeviceInfo.X_TMOBILE_GlobalIPAddress
    [Documentation]  Device.DeviceInfo.X_TMOBILE_GlobalIPAddress
    write       uci_restful -r /restful/geoip/globalIP GET
    set client configuration  prompt=#
    ${output}=         read Until prompt
    should not contain  ${output}   fail

Device.DeviceInfo.X_TMOBILE_IMEI
    [Tags]    Device.DeviceInfo.X_TMOBILE_IMEI
    [Documentation]  Device.DeviceInfo.X_TMOBILE_IMEI
    write       uci_restful -r /restful/lte/device_info GET
    set client configuration  prompt=#
    ${output}=         read Until prompt
    should not contain  ${output}   fail

Device.DeviceInfo.UpTime
    [Tags]  Device.DeviceInfo.UpTime
    [Documentation]  Device.DeviceInfo.UpTime
    write   uci_restful -r /restful/sysadm/device_info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_DataUsage.Cellular.Day.1.Date
    [Tags]  Device.X_TMOBILE_DataUsage.Cellular.Day.1.Date
    [Documentation]  Device.X_TMOBILE_DataUsage.Cellular.Day.1.Date
    write   uci_restful -r /restful/traffic/daily GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_DataUsage.Cellular.Day.1.Received
    [Tags]  Device.X_TMOBILE_DataUsage.Cellular.Day.1.Received
    [Documentation]  Device.X_TMOBILE_DataUsage.Cellular.Day.1.Received
    write   uci_restful -r /restful/traffic/daily GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_DataUsage.Cellular.Day.1.Sent
    [Tags]  Device.X_TMOBILE_DataUsage.Cellular.Day.1.Sent
    [Documentation]  Device.X_TMOBILE_DataUsage.Cellular.Day.1.Sent
    write   uci_restful -r /restful/traffic/daily GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_DataUsage.Cellular.Day.1.TotalTransmit
    [Tags]  Device.X_TMOBILE_DataUsage.Cellular.Day.1.TotalTransmit
    [Documentation]  Device.X_TMOBILE_DataUsage.Cellular.Day.1.TotalTransmit
    write   uci_restful -r /restful/traffic/daily GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_ISIM.IMSI
    [Tags]  Device.X_TMOBILE_ISIM.IMSI
    [Documentation]  Device.X_TMOBILE_ISIM.IMSI
    write   uci_restful -r /restful/lte/device_info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_ISIM.SIMStatus
    [Tags]  Device.X_TMOBILE_ISIM.SIMStatus
    [Documentation]  Device.X_TMOBILE_ISIM.SIMStatus
    write   uci_restful -r /restful/lte/device_info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Voice.MSISDN
    [Tags]  Device.X_TMOBILE_Voice.MSISDN
    [Documentation]  Device.X_TMOBILE_Voice.MSISDN
    write   uci_restful -r /restful/lte/device_info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.CellTower.1.MCC
    [Tags]  Device.X_TMOBILE_Cellular.CellTower.1.MCC
    [Documentation]  Device.X_TMOBILE_Cellular.CellTower.1.MCC
    write   uci_restful -r /restful/lte/cellular_info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.CellTower.1.MNC
    [Tags]  Device.X_TMOBILE_Cellular.CellTower.1.MNC
    [Documentation]  Device.X_TMOBILE_Cellular.CellTower.1.MNC
    write   uci_restful -r /restful/lte/cellular_info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.CellTower.1.LAC
    [Tags]  Device.X_TMOBILE_Cellular.CellTower.1.LAC
    [Documentation]  Device.X_TMOBILE_Cellular.CellTower.1.LAC
    write   uci_restful -r /restful/lte/cellular_info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.CellTower.1.CID
    [Tags]  Device.X_TMOBILE_Cellular.CellTower.1.CID
    [Documentation]  Device.X_TMOBILE_Cellular.CellTower.1.CID
    write   uci_restful -r /restful/lte/cellular_info_ex GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.CellTower.1.RSSI
    [Tags]  Device.X_TMOBILE_Cellular.CellTower.1.RSSI
    [Documentation]  Device.X_TMOBILE_Cellular.CellTower.1.RSSI
    write   uci_restful -r /restful/lte/cellular_info_ex GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.CellTower.1.RSRQ
    [Tags]  Device.X_TMOBILE_Cellular.CellTower.1.RSSI
    [Documentation]  Device.X_TMOBILE_Cellular.CellTower.1.RSSI
    write   uci_restful -r /restful/lte/cellular_info_ex GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.CellTower.1.RSRP
    [Tags]  Device.X_TMOBILE_Cellular.CellTower.1.RSRP
    [Documentation]  Device.X_TMOBILE_Cellular.CellTower.1.RSRP
    write   uci_restful -r /restful/lte/cellular_info_ex GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.CellTower.1.SNR
    [Tags]  Device.X_TMOBILE_Cellular.CellTower.1.SNR
    [Documentation]  Device.X_TMOBILE_Cellular.CellTower.1.SNR
    write   uci_restful -r /restful/lte/cellular_info_ex GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.CellTower.1.Srxlev
    [Tags]  Device.X_TMOBILE_Cellular.CellTower.1.Srxlev
    [Documentation]  Device.X_TMOBILE_Cellular.CellTower.1.Srxlev
    write   uci_restful -r /restful/lte/cellular_info_ex GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.CellTower.1.Band
    [Tags]  Device.X_TMOBILE_Cellular.CellTower.1.Band
    [Documentation]  Device.X_TMOBILE_Cellular.CellTower.1.Band
    write   uci_restful -r /restful/lte/cellular_info_ex GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.CellTower.1.Bandwidth
    [Tags]  Device.X_TMOBILE_Cellular.CellTower.1.Bandwidth
    [Documentation]  Device.X_TMOBILE_Cellular.CellTower.1.Bandwidth
    write   uci_restful -r /restful/lte/cellular_info_ex GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.CellTower.1.RxChannel
    [Tags]  Device.X_TMOBILE_Cellular.CellTower.1.RxChannel
    [Documentation]  Device.X_TMOBILE_Cellular.CellTower.1.RxChannel
    write   uci_restful -r /restful/lte/cellular_info_ex GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.CellTower.1.TxChannel
    [Tags]  Device.X_TMOBILE_Cellular.CellTower.1.TxChannel
    [Documentation]  Device.X_TMOBILE_Cellular.CellTower.1.TxChannel
    write   uci_restful -r /restful/lte/cellular_info_ex GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.CellTower.1.TAC
    [Tags]  Device.X_TMOBILE_Cellular.CellTower.1.TAC
    [Documentation]  Device.X_TMOBILE_Cellular.CellTower.1.TAC
    write   uci_restful -r /restful/lte/cellular_info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.CellTower.1.eNB
    [Tags]  Device.X_TMOBILE_Cellular.CellTower.1.eNB
    [Documentation]  Device.X_TMOBILE_Cellular.CellTower.1.eNB
    write   uci_restful -r /restful/lte/cellular_info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.CellTower.1.CQI
    [Tags]  Device.X_TMOBILE_Cellular.CellTower.1.CQI
    [Documentation]  Device.X_TMOBILE_Cellular.CellTower.1.CQI
    write   uci_restful -r /restful/lte/cellular_info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.CellTower.1.ServingTime
    [Tags]  Device.X_TMOBILE_Cellular.CellTower.1.ServingTime
    [Documentation]  Device.X_TMOBILE_Cellular.CellTower.1.ServingTime
    write   uci_restful -r /restful/lte/cellular_info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.CellTower.1.UL
    [Tags]  Device.X_TMOBILE_Cellular.CellTower.1.UL
    [Documentation]  Device.X_TMOBILE_Cellular.CellTower.1.UL
    write   uci_restful -r /restful/lte/cellular_info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.CellTower.1.DL
    [Tags]  Device.X_TMOBILE_Cellular.CellTower.1.DL
    [Documentation]  Device.X_TMOBILE_Cellular.CellTower.1.DL
    write   uci_restful -r /restful/lte/cellular_info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.CellTower.1.CA_State
    [Tags]  Device.X_TMOBILE_Cellular.CellTower.1.CA_State
    [Documentation]  Device.X_TMOBILE_Cellular.CellTower.1.CA_State
    write   uci_restful -r /restful/lte/cellular_info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.CellTower.1.Scell_Band
    [Tags]  Device.X_TMOBILE_Cellular.CellTower.1.Scell_Band
    [Documentation]  Device.X_TMOBILE_Cellular.CellTower.1.Scell_Band
    write   uci_restful -r /restful/lte/cellular_info_ex GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.CellTower.1.Scell_Bandwidth
    [Tags]  Device.X_TMOBILE_Cellular.CellTower.1.Scell_Bandwidth
    [Documentation]  Device.X_TMOBILE_Cellular.CellTower.1.Scell_Bandwidth
    write   uci_restful -r /restful/lte/cellular_info_ex GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.CellTower.1.Scell_Channel
    [Tags]  Device.X_TMOBILE_Cellular.CellTower.1.Scell_Channel
    [Documentation]  Device.X_TMOBILE_Cellular.CellTower.1.Scell_Channel
    write   uci_restful -r /restful/lte/cellular_info_ex GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.CellTowerNumberOfEntries
    [Tags]  Device.X_TMOBILE_Cellular.CellTowerNumberOfEntries
    [Documentation]  Device.X_TMOBILE_Cellular.CellTowerNumberOfEntries
    write   uci_restful -r /restful/lte/cellular_info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.ConnectedCellTower
    [Tags]  Device.X_TMOBILE_Cellular.ConnectedCellTower
    [Documentation]  Device.X_TMOBILE_Cellular.ConnectedCellTower
    write   uci_restful -r /restful/lte/cellular_info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.PresentMonthDataUsage
    [Tags]  Device.X_TMOBILE_Cellular.PresentMonthDataUsage
    [Documentation]  Device.X_TMOBILE_Cellular.PresentMonthDataUsage
    write   uci_restful -r /restful/traffic/monthly GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.CGI #to be continued here

uci
    [Tags]  uci
    [Documentation]  uci
    write   uci
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail




*** Keywords ***
Open Connection And Log In
   Open Connection     ${HOST}
   Login               ${USERNAME}        ${PASSWORD}
