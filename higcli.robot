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
    set client configuration  prompt=#
    ${output}=         read Until prompt
    should not contain  ${output}   fail
    should contain  ${output}   data #

Device.DeviceInfo.X_TMOBILE_MACAddress
    [Tags]  Device.DeviceInfo.X_TMOBILE_MACAddress
    [Documentation]  Device.DeviceInfo.X_TMOBILE_MACAddress
    write       uci_restful -r /restful/tr069/dev_info GET
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
    write   uci_restful -r /restful/tr069/dev_info GET
    #write   uci_restful -r /restful/sysadm/device_info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.DeviceInfo.ManufaturerOUI
    [Tags]  Device.DeviceInfo.ManufaturerOUI
    [Documentation]  Device.DeviceInfo.ManufaturerOUI
    write   uci_restful -r /restful/tr069/dev_info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.DeviceInfo.ProductClass
    [Tags]  Device.DeviceInfo.ProductClass
    [Documentation]  Device.DeviceInfo.ProductClass
    write   uci_restful -r /restful/tr069/dev_info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.DeviceInfo.SerialNumber
    [Tags]  Device.DeviceInfo.SerialNumber
    [Documentation]  Device.DeviceInfo.SerialNumber
    write   uci_restful -r /restful/tr069/dev_info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_DataUsage.Cellular.Day.1.Date
    [Tags]  Device.X_TMOBILE_DataUsage.Cellular.Day.1.Date
    [Documentation]  Device.X_TMOBILE_DataUsage.Cellular.Day.1.Date
    write   uci_restful -r /restful/traffic/daily/0 GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_DataUsage.Cellular.Day.1.Received
    [Tags]  Device.X_TMOBILE_DataUsage.Cellular.Day.1.Received
    [Documentation]  Device.X_TMOBILE_DataUsage.Cellular.Day.1.Received
    write   uci_restful -r /restful/traffic/daily/0 GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_DataUsage.Cellular.Day.1.Sent
    [Tags]  Device.X_TMOBILE_DataUsage.Cellular.Day.1.Sent
    [Documentation]  Device.X_TMOBILE_DataUsage.Cellular.Day.1.Sent
    write   uci_restful -r /restful/traffic/daily/0 GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_DataUsage.Cellular.Day.1.TotalTransmit
    [Tags]  Device.X_TMOBILE_DataUsage.Cellular.Day.1.TotalTransmit
    [Documentation]  Device.X_TMOBILE_DataUsage.Cellular.Day.1.TotalTransmit
    write   uci_restful -r /restful/traffic/daily/0 GET
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
    [Tags]  Device.X_TMOBILE_Cellular.CellTower.1.RSRQ
    [Documentation]  Device.X_TMOBILE_Cellular.CellTower.1.RSRQ
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


Device.X_TMOBILE_Cellular.CGI
    [Tags]  Device.X_TMOBILE_Cellular.CGI
    [Documentation]  Device.X_TMOBILE_Cellular.CGI
    write   uci_restful -r /restful/lte/cellular_info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

#Device.X_TMOBILE_Cellular.MonthlyDataUsageQuota
#    [Tags]  Device.X_TMOBILE_Cellular.MonthlyDataUsageQuota
#    [Documentation]  Device.X_TMOBILE_Cellular.MonthlyDataUsageQuota
#    write   fail not ready / no UCI yet
#    Set client configuration  prompt=#
#    ${output}=         Read Until prompt
#    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.Roaming
    [Tags]  Device.X_TMOBILE_Cellular.Roaming
    [Documentation]  Device.X_TMOBILE_Cellular.Roaming
    write   uci_restful -r /restful/lte/serving_nw_info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.APN
    [Tags]  Device.X_TMOBILE_Cellular.APN
    [Documentation]  Device.X_TMOBILE_Cellular.APN
    write   uci_restful -r /restful/lte/serving_nw_info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Cellular.Status
    [Tags]  Device.X_TMOBILE_Cellular.Status
    [Documentation]  Device.X_TMOBILE_Cellular.Status
    write   uci_restful -r /restful/tr069/dev_info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Battery.RemainingRuntime
    [Tags]  Device.X_TMOBILE_Battery.RemainingRuntime
    [Documentation]  Device.X_TMOBILE_Battery.RemainingRuntime
    write   uci_restful -r /restful/battery/remaining GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Battery.RemainingCapacity
    [Tags]  Device.X_TMOBILE_Battery.RemainingCapacity
    [Documentation]  Device.X_TMOBILE_Battery.RemainingCapacity
    write   uci_restful -r /restful/battery/remaining GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Battery.FullChargerCapacity
    [Tags]  Device.X_TMOBILE_Battery.FullChargerCapacity
    [Documentation]  Device.X_TMOBILE_Battery.FullChargerCapacity
    write   uci_restful -r /restful/battery/capacity GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Battery.DesignCapacity
    [Tags]  Device.X_TMOBILE_Battery.DesignCapacity
    [Documentation]  Device.X_TMOBILE_Battery.DesignCapacity
    write   uci_restful -r /restful/battery/capacity GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Battery.CycleCount
    [Tags]  Device.X_TMOBILE_Battery.CycleCount
    [Documentation]  Device.X_TMOBILE_Battery.CycleCount
    write   uci_restful -r /restful/battery/status GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Battery.NeedReplacement
    [Tags]  Device.X_TMOBILE_Battery.NeedReplacement
    [Documentation]  Device.X_TMOBILE_Battery.NeedReplacement
    write   uci_restful -r /restful/battery/status GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Battery.ChargingCurrent
    [Tags]  Device.X_TMOBILE_Battery.ChargingCurrent
    [Documentation]  Device.X_TMOBILE_Battery.ChargingCurrent
    write   uci_restful -r /restful/battery/output GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Battery.Temperature
    [Tags]  Device.X_TMOBILE_Battery.Temperature
    [Documentation]  Device.X_TMOBILE_Battery.Temperature
    write   uci_restful -r /restful/battery/output GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Battery.Current
    [Tags]  Device.X_TMOBILE_Battery.Current
    [Documentation]  Device.X_TMOBILE_Battery.Current
    write   uci_restful -r /restful/battery/output GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Battery.Voltage
    [Tags]  Device.X_TMOBILE_Battery.Voltage
    [Documentation]  Device.X_TMOBILE_Battery.Voltage
    write   uci_restful -r /restful/battery/output GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Battery.Level
    [Tags]  Device.X_TMOBILE_Battery.Level
    [Documentation]  Device.X_TMOBILE_Battery.Level
    write   uci_restful -r /restful/battery/output GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Battery.InCharging
    [Tags]  Device.X_TMOBILE_Battery.InCharging
    [Documentation]  Device.X_TMOBILE_Battery.InCharging
    write   uci_restful -r /restful/battery/output GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.X_TMOBILE_Battery.ConnectStatus
    [Tags]  Device.X_TMOBILE_Battery.ConnectStatus
    [Documentation]  Device.X_TMOBILE_Battery.ConnectStatus
    write   uci_restful -r /restful/battery/status GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.Hosts.Host.x.PhysAddress
    [Tags]  Device.Hosts.Host.x.PhysAddress
    [Documentation]  Device.Hosts.Host.x.PhysAddress
    write   uci_restful -r /restful/hosttable/info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.Hosts.Host.x.IPAddress
    [Tags]  Device.Hosts.Host.x.IPAddress
    [Documentation]  Device.Hosts.Host.x.IPAddress
    write   uci_restful -r /restful/hosttable/info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.Hosts.Host.x.HostName
    [Tags]  Device.Hosts.Host.x.HostName
    [Documentation]  Device.Hosts.Host.x.HostName
    write   uci_restful -r /restful/hosttable/info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.Hosts.Host.x.Active
    [Tags]  Device.Hosts.Host.x.Active
    [Documentation]  Device.Hosts.Host.x.Active
    write   uci_restful -r /restful/hosttable/info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.Hosts.Host.x.X_TMOBILE_DailyUsage_UL
    [Tags]  Device.Hosts.Host.x.X_TMOBILE_DailyUsage_UL
    [Documentation]  Device.Hosts.Host.x.X_TMOBILE_DailyUsage_UL
    write   uci_restful -r /restful/hosttable/info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.Hosts.Host.x.X_TMOBILE_DailyUsage_DL
    [Tags]  Device.Hosts.Host.x.X_TMOBILE_DailyUsage_DL
    [Documentation]  Device.Hosts.Host.x.X_TMOBILE_DailyUsage_DL
    write   uci_restful -r /restful/hosttable/info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.Hosts.Host.x.X_TMOBILE_MonthlyUsage_UL
    [Tags]  Device.Hosts.Host.x.X_TMOBILE_MonthlyUsage_UL
    [Documentation]  Device.Hosts.Host.x.X_TMOBILE_MonthlyUsage_UL
    write   uci_restful -r /restful/hosttable/info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.Hosts.Host.x.X_TMOBILE_MonthlyUsage_DL
    [Tags]  Device.Hosts.Host.x.X_TMOBILE_MonthlyUsage_DL
    [Documentation]  Device.Hosts.Host.x.X_TMOBILE_MonthlyUsage_DL
    write   uci_restful -r /restful/hosttable/info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.Hosts.Host.x.X_TMOBILE_connectionType
    [Tags]  Device.Hosts.Host.x.X_TMOBILE_connectionType
    [Documentation]  Device.Hosts.Host.x.X_TMOBILE_connectionType
    write   uci_restful -r /restful/hosttable/info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.Hosts.Host.x.X_TMOBILE_WiFi_SSID
    [Tags]  Device.Hosts.Host.x.X_TMOBILE_WiFi_SSID
    [Documentation]  Device.Hosts.Host.x.X_TMOBILE_WiFi_SSID
    write   uci_restful -r /restful/hosttable/info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.Hosts.Host.x.X_TMOBILE_WiFi_Security
    [Tags]  Device.Hosts.Host.x.X_TMOBILE_WiFi_Security
    [Documentation]  Device.Hosts.Host.x.X_TMOBILE_WiFi_Security
    write   uci_restful -r /restful/hosttable/info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.Hosts.Host.x.X_TMOBILE_WiFi_Version
    [Tags]  Device.Hosts.Host.x.X_TMOBILE_WiFi_Version
    [Documentation]  Device.Hosts.Host.x.X_TMOBILE_WiFi_Versio
    write   uci_restful -r /restful/hosttable/info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.Hosts.Host.x.X_TMOBILE_WiFi_Encryption
    [Tags]  Device.Hosts.Host.x.X_TMOBILE_WiFi_Encryption
    [Documentation]  Device.Hosts.Host.x.X_TMOBILE_WiFi_Encryption
    write   uci_restful -r /restful/hosttable/info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.Hosts.Host.x.X_TMOBILE_Last_Connection_Error
    [Tags]  Device.Hosts.Host.x.X_TMOBILE_Last_Connection_Error
    [Documentation]  Device.Hosts.Host.x.X_TMOBILE_Last_Connection_Error
    write   uci_restful -r /restful/hosttable/info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.Hosts.HostNumberOfEntries
    [Tags]  Device.Hosts.HostNumberOfEntries
    [Documentation]  Device.Hosts.HostNumberOfEntries
    write   uci_restful -r /restful/hosttable/info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail

Device.MQTT.Client.{i}.Subscription.{i}.Topic
    [Tags]      Device.MQTT.Client.{i}.Subscription.{i}.Topic
    [Documentation]      Device.MQTT.Client.{i}.Subscription.{i}.Topic
    write   uci_restful -r /restful/mqttclient/client GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt    loglevel=WARN
    should not contain  ${output}   fail
    #should not contain  ${output}   no content

Device.MQTT.Client.{i}.Subscription.{i}.QoS
    [Tags]      Device.MQTT.Client.{i}.Subscription.{i}.QoS
    [Documentation]      Device.MQTT.Client.{i}.Subscription.{i}.QoS
    write   uci_restful -r /restful/mqttclient/client GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt    loglevel=WARN
    should not contain  ${output}   fail
    #should not contain  ${output}   no content

Device.MQTT.Client.{i}.Subscription.{i}.Enable
    [Tags]      Device.MQTT.Client.{i}.Subscription.{i}.Enable
    [Documentation]      Device.MQTT.Client.{i}.Subscription.{i}.Enable
    write   uci_restful -r /restful/mqttclient/client GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt    loglevel=WARN
    should not contain  ${output}   fail
    #should not contain  ${output}   no content

Device.LocalAgent.Controller.{i}.MTP.{i}.MQTT.Topic
    [Tags]      Device.LocalAgent.Controller.{i}.MTP.{i}.MQTT.Topic
    [Documentation]      Device.LocalAgent.Controller.{i}.MTP.{i}.MQTT.Topic
    write   uci_restful -r /restful/mqttclient/client GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt    loglevel=WARN
    should not contain  ${output}   fail
    #should not contain  ${output}   no content

Device.LocalAgent.Controller.{i}.MTP.{i}.MQTT.Reference
    [Tags]      Device.LocalAgent.Controller.{i}.MTP.{i}.MQTT.Reference
    [Documentation]      Device.LocalAgent.Controller.{i}.MTP.{i}.MQTT.Reference
    write   uci_restful -r /restful/mqttclient/client GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt    loglevel=WARN
    should not contain  ${output}   fail
    #should not contain  ${output}   no content

Device.MQTT.Client.{i}.Username
    [Tags]          Device.MQTT.Client.{i}.Username
    [Documentation]          Device.MQTT.Client.{i}.Username
    write   uci_restful -r /restful/mqttclient/client GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt    loglevel=WARN
    should not contain  ${output}   fail
    #should not contain  ${output}   no content

Device.MQTT.Client.{i}.Password
    [Tags]          Device.MQTT.Client.{i}.Password
    [Documentation]          Device.MQTT.Client.{i}.Password
    write   uci_restful -r /restful/mqttclient/client GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt    loglevel=WARN
    should not contain  ${output}   fail
    #should not contain  ${output}   no content

Device.MQTT.Client.{i}.ClientID
    [Tags]          Device.MQTT.Client.{i}.ClientID
    [Documentation]          Device.MQTT.Client.{i}.ClientID
    write   uci_restful -r /restful/mqttclient/client GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt    loglevel=WARN
    should not contain  ${output}   fail
    #should not contain  ${output}   no content

Device.MQTT.Client.{i}.BrokerAddress
    [Tags]          Device.MQTT.Client.{i}.BrokerAddress
    [Documentation]          Device.MQTT.Client.{i}.BrokerAddress
    write   uci_restful -r /restful/mqttclient/client GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt    loglevel=WARN
    should not contain  ${output}   fail
    #should not contain  ${output}   no content

Device.MQTT.Client.{i}.BrokerPort
    [Tags]          Device.MQTT.Client.{i}.BrokerPort
    [Documentation]          Device.MQTT.Client.{i}.BrokerPort
    write   uci_restful -r /restful/mqttclient/client GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt    loglevel=WARN
    should not contain  ${output}   fail
    #should not contain  ${output}   no content

Device.MQTT.Client.{i}.Enable
    [Tags]          Device.MQTT.Client.{i}.Enable
    [Documentation]          Device.MQTT.Client.{i}.Enable
    write   uci_restful -r /restful/mqttclient/client GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt    loglevel=WARN
    should not contain  ${output}   fail
    #should not contain  ${output}   no content

Device.WiFi.xxx.SSID
    [Tags]          Device.WiFi.xxx.SSID
    [Documentation]          Device.WiFi.xxx.SSID
    write   uci_restful -r /restful/wifiap/ssid GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail
    #should not contain  ${output}   no content

Device.WiFi.xxx.Security
    [Tags]          Device.WiFi.xxx.Security
    [Documentation]          Device.WiFi.xxx.Security
    write   uci_restful -r /restful/wifiap/security GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail
    #should not contain  ${output}   no content

Device.WiFi.xxx.Version
    [Tags]          Device.WiFi.xxx.Version
    [Documentation]          Device.WiFi.xxx.Version
    write   uci_restful -r /restful/wifiap/version GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail
    #should not contain  ${output}   no content

Device.WiFi.xxx.Encryption
    [Tags]          Device.WiFi.xxx.Encryption
    [Documentation]          Device.WiFi.xxx.Encryption
    write   uci_restful -r /restful/wifiap/encryption GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail
    #should not contain  ${output}   no content


uci
    [Tags]  uci
    [Documentation]  uci
    write   uci
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail
    should not contain  ${output}   no content




*** Keywords ***
Open Connection And Log In
   Open Connection     ${HOST}
   Login               ${USERNAME}        ${PASSWORD}
