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
    should not contain  ${output}   fail    uci_restful: not found
    should contain  ${output}   data #

uci_restful -r /restful/tr069/dev_info GET
    [Tags]              Device.DeviceInfo.X_TMOBILE_MACAddress  Device.DeviceInfo.UpTime
    ...                 Device.DeviceInfo.ManufaturerOUI        Device.DeviceInfo.ProductClass
    ...                 Device.DeviceInfo.SerialNumber          Device.X_TMOBILE_Cellular.Status
    #max is 6 tags so continue on next test case
    [Documentation]     Device.DeviceInfo.X_TMOBILE_MACAddress  Device.DeviceInfo.UpTime
    ...                 Device.DeviceInfo.ManufaturerOUI        Device.DeviceInfo.ProductClass
    ...                 Device.DeviceInfo.SerialNumber          Device.X_TMOBILE_Cellular.Status
    write               uci_restful -r /restful/tr069/dev_info GET
    set client configuration  prompt=#
    ${output}=         read Until prompt
    should not contain  ${output}   fail    uci_restful: not found

uci_restful -r /restful/tr069/dev_info GET (continued)
    [Tags]              Device.X_TMOBILE_Cellular.Status
    [Documentation]     Device.X_TMOBILE_Cellular.Status
    write               uci_restful -r /restful/tr069/dev_info GET
    set client configuration  prompt=#
    ${output}=         read Until prompt
    should not contain  ${output}   fail    uci_restful: not found

uci_restful -r /restful/geoip/globalIP GET
    [Tags]              Device.DeviceInfo.X_TMOBILE_GlobalIPAddress
    [Documentation]     Device.DeviceInfo.X_TMOBILE_GlobalIPAddress
    write               uci_restful -r /restful/geoip/globalIP GET
    set client configuration  prompt=#
    ${output}=         read Until prompt
    should not contain  ${output}   fail    uci_restful: not found

uci_restful -r /restful/lte/device_info GET
    [Tags]              Device.DeviceInfo.X_TMOBILE_IMEI    Device.X_TMOBILE_ISIM.IMSI
    ...                 Device.X_TMOBILE_ISIM.SIMStatus     Device.X_TMOBILE_Voice.MSISDN
    [Documentation]     Device.DeviceInfo.X_TMOBILE_IMEI    Device.X_TMOBILE_ISIM.IMSI
    ...                 Device.X_TMOBILE_ISIM.SIMStatus     Device.X_TMOBILE_Voice.MSISDN
    write               uci_restful -r /restful/lte/device_info GET
    set client configuration  prompt=#
    ${output}=         read Until prompt
    should not contain  ${output}   fail    uci_restful: not found

uci_restful -r /restful/traffic/daily/0 GET
    [Tags]              Device.X_TMOBILE_DataUsage.Cellular.Day.1.Date    Device.X_TMOBILE_DataUsage.Cellular.Day.1.Received
    ...                 Device.X_TMOBILE_DataUsage.Cellular.Day.1.Sent    Device.X_TMOBILE_DataUsage.Cellular.Day.1.TotalTransmit
    [Documentation]     Device.X_TMOBILE_DataUsage.Cellular.Day.1.Date    Device.X_TMOBILE_DataUsage.Cellular.Day.1.Received
    ...                 Device.X_TMOBILE_DataUsage.Cellular.Day.1.Sent    Device.X_TMOBILE_DataUsage.Cellular.Day.1.TotalTransmit
    write               uci_restful -r /restful/traffic/daily/0 GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail    uci_restful: not found

uci_restful -r /restful/lte/cellular_info GET
    [Tags]              Device.X_TMOBILE_Cellular.CellTower.1.MCC    Device.X_TMOBILE_Cellular.CellTower.1.MNC
    ...                 Device.X_TMOBILE_Cellular.CellTower.1.LAC    Device.X_TMOBILE_Cellular.CellTower.1.TAC
    ...                 Device.X_TMOBILE_Cellular.CellTower.1.eNB    Device.X_TMOBILE_Cellular.CellTower.1.CQI
    #continued, 6 tags max
    [Documentation]     Device.X_TMOBILE_Cellular.CellTower.1.MCC    Device.X_TMOBILE_Cellular.CellTower.1.MNC
    ...                 Device.X_TMOBILE_Cellular.CellTower.1.LAC    Device.X_TMOBILE_Cellular.CellTower.1.TAC
    ...                 Device.X_TMOBILE_Cellular.CellTower.1.eNB    Device.X_TMOBILE_Cellular.CellTower.1.CQI
    write               uci_restful -r /restful/lte/cellular_info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail    uci_restful: not found

uci_restful -r /restful/lte/cellular_info GET (continued part 1)
    [Tags]              Device.X_TMOBILE_Cellular.CellTower.1.ServingTime    Device.X_TMOBILE_Cellular.CellTower.1.UL
    ...                 Device.X_TMOBILE_Cellular.CellTower.1.DL    Device.X_TMOBILE_Cellular.CellTower.1.CA_State
    ...                 Device.X_TMOBILE_Cellular.CellTowerNumberOfEntries    Device.X_TMOBILE_Cellular.ConnectedCellTower
    #continued, 6 tags max
    [Documentation]     Device.X_TMOBILE_Cellular.CellTower.1.ServingTime    Device.X_TMOBILE_Cellular.CellTower.1.UL
    ...                 Device.X_TMOBILE_Cellular.CellTower.1.DL    Device.X_TMOBILE_Cellular.CellTower.1.CA_State
    ...                 Device.X_TMOBILE_Cellular.CellTowerNumberOfEntries    Device.X_TMOBILE_Cellular.ConnectedCellTower
    write               uci_restful -r /restful/lte/cellular_info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail    uci_restful: not found

uci_restful -r /restful/lte/cellular_info GET (continued part 2)
    [Tags]              Device.X_TMOBILE_Cellular.CGI
    [Documentation]     Device.X_TMOBILE_Cellular.CGI
    write               uci_restful -r /restful/lte/cellular_info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail    uci_restful: not found

uci_restful -r /restful/lte/cellular_info_ex GET
    [Tags]              Device.X_TMOBILE_Cellular.CellTower.1.CID    Device.X_TMOBILE_Cellular.CellTower.1.RSSI
    ...                 Device.X_TMOBILE_Cellular.CellTower.1.RSRQ    Device.X_TMOBILE_Cellular.CellTower.1.RSRP
    ...                 Device.X_TMOBILE_Cellular.CellTower.1.SNR    Device.X_TMOBILE_Cellular.CellTower.1.Srxlev
    #continued, 6 tags max
    [Documentation]     Device.X_TMOBILE_Cellular.CellTower.1.CID    Device.X_TMOBILE_Cellular.CellTower.1.RSSI
    ...                 Device.X_TMOBILE_Cellular.CellTower.1.RSRQ    Device.X_TMOBILE_Cellular.CellTower.1.RSRP
    ...                 Device.X_TMOBILE_Cellular.CellTower.1.SNR    Device.X_TMOBILE_Cellular.CellTower.1.Srxlev
    write               uci_restful -r /restful/lte/cellular_info_ex GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail    uci_restful: not found

uci_restful -r /restful/lte/cellular_info_ex GET (continued part 1)
    [Tags]              Device.X_TMOBILE_Cellular.CellTower.1.Band         Device.X_TMOBILE_Cellular.CellTower.1.Bandwidth
    ...                 Device.X_TMOBILE_Cellular.CellTower.1.RxChannel    Device.X_TMOBILE_Cellular.CellTower.1.TxChannel
    ...                 Device.X_TMOBILE_Cellular.CellTower.1.Scell_Band   Device.X_TMOBILE_Cellular.CellTower.1.Scell_Bandwidth
    #continued, 6 tags max
    [Documentation]     Device.X_TMOBILE_Cellular.CellTower.1.Srxlev         Device.X_TMOBILE_Cellular.CellTower.1.Bandwidth
    ...                 Device.X_TMOBILE_Cellular.CellTower.1.RxChannel    Device.X_TMOBILE_Cellular.CellTower.1.TxChannel
    ...                 Device.X_TMOBILE_Cellular.CellTower.1.Scell_Band   Device.X_TMOBILE_Cellular.CellTower.1.Scell_Bandwidth
    write               uci_restful -r /restful/lte/cellular_info_ex GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail    uci_restful: not found

uci_restful -r /restful/lte/cellular_info_ex GET (continued part 2)
    [Tags]              Device.X_TMOBILE_Cellular.CellTower.1.Scell_Channel
    [Documentation]     Device.X_TMOBILE_Cellular.CellTower.1.Scell_Channel
    write               uci_restful -r /restful/lte/cellular_info_ex GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail    uci_restful: not found

uci_restful -r /restful/traffic/monthly GET
    [Tags]              Device.X_TMOBILE_Cellular.PresentMonthDataUsage
    [Documentation]     Device.X_TMOBILE_Cellular.PresentMonthDataUsage
    write               uci_restful -r /restful/traffic/monthly GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail    uci_restful: not found


#Device.X_TMOBILE_Cellular.MonthlyDataUsageQuota
#    [Tags]  Device.X_TMOBILE_Cellular.MonthlyDataUsageQuota
#    [Documentation]  Device.X_TMOBILE_Cellular.MonthlyDataUsageQuota
#    write   fail not ready / no UCI yet
#    Set client configuration  prompt=#
#    ${output}=         Read Until prompt
#    should not contain  ${output}   fail    uci_restful: not found

uci_restful -r /restful/lte/serving_nw_info GET
    [Tags]              Device.X_TMOBILE_Cellular.Roaming   Device.X_TMOBILE_Cellular.APN
    [Documentation]     Device.X_TMOBILE_Cellular.Roaming   Device.X_TMOBILE_Cellular.APN
    write               uci_restful -r /restful/lte/serving_nw_info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail    uci_restful: not found

uci_restful -r /restful/battery/remaining GET
    [Tags]              Device.X_TMOBILE_Battery.RemainingRuntime    Device.X_TMOBILE_Battery.RemainingCapacity
    [Documentation]     Device.X_TMOBILE_Battery.RemainingRuntime    Device.X_TMOBILE_Battery.RemainingCapacity
    write               uci_restful -r /restful/battery/remaining GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail    uci_restful: not found

uci_restful -r /restful/battery/capacity GET
    [Tags]              Device.X_TMOBILE_Battery.FullChargerCapacity    Device.X_TMOBILE_Battery.DesignCapacity
    [Documentation]     Device.X_TMOBILE_Battery.FullChargerCapacity    Device.X_TMOBILE_Battery.DesignCapacity
    write               uci_restful -r /restful/battery/capacity GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail    uci_restful: not found

uci_restful -r /restful/battery/status GET
    [Tags]              Device.X_TMOBILE_Battery.CycleCount    Device.X_TMOBILE_Battery.NeedReplacement
    ...                 Device.X_TMOBILE_Battery.ConnectStatus
    [Documentation]     Device.X_TMOBILE_Battery.CycleCount    Device.X_TMOBILE_Battery.NeedReplacement
    ...                 Device.X_TMOBILE_Battery.ConnectStatus
    write               uci_restful -r /restful/battery/status GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail    uci_restful: not found

uci_restful -r /restful/battery/output GET
    [Tags]              Device.X_TMOBILE_Battery.ChargingCurrent    Device.X_TMOBILE_Battery.Temperature
    ...                 Device.X_TMOBILE_Battery.Current            Device.X_TMOBILE_Battery.Voltage
    ...                 Device.X_TMOBILE_Battery.Level              Device.X_TMOBILE_Battery.InCharging
    [Documentation]     Device.X_TMOBILE_Battery.ChargingCurrent
    write               uci_restful -r /restful/battery/output GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail    uci_restful: not found

uci_restful -r /restful/hosttable/info GET
    [Tags]              Device.Hosts.Host.x.PhysAddress                 Device.Hosts.Host.x.IPAddress
    ...                 Device.Hosts.Host.x.HostName                    Device.Hosts.Host.x.Active
    ...                 Device.Hosts.Host.x.X_TMOBILE_DailyUsage_UL     Device.Hosts.Host.x.X_TMOBILE_DailyUsage_DL
    #continued, 6 tags max
    [Documentation]     Device.Hosts.Host.x.PhysAddress                 Device.Hosts.Host.x.IPAddress
    ...                 Device.Hosts.Host.x.HostName                    Device.Hosts.Host.x.Active
    ...                 Device.Hosts.Host.x.X_TMOBILE_DailyUsage_UL     Device.Hosts.Host.x.X_TMOBILE_DailyUsage_DL
    write               uci_restful -r /restful/hosttable/info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail    uci_restful: not found

uci_restful -r /restful/hosttable/info GET (continued part 1)
    [Tags]              Device.Hosts.Host.x.X_TMOBILE_MonthlyUsage_UL   Device.Hosts.Host.x.X_TMOBILE_MonthlyUsage_DL
    ...                 Device.Hosts.Host.x.X_TMOBILE_connectionType    Device.Hosts.Host.x.X_TMOBILE_WiFi_SSID
    ...                 Device.Hosts.Host.x.X_TMOBILE_WiFi_Security     Device.Hosts.Host.x.X_TMOBILE_WiFi_Version
    #continued, 6 tags max
    [Documentation]     Device.Hosts.Host.x.X_TMOBILE_MonthlyUsage_UL   Device.Hosts.Host.x.X_TMOBILE_MonthlyUsage_DL
    ...                 Device.Hosts.Host.x.X_TMOBILE_connectionType    Device.Hosts.Host.x.X_TMOBILE_WiFi_SSID
    ...                 Device.Hosts.Host.x.X_TMOBILE_WiFi_Security     Device.Hosts.Host.x.X_TMOBILE_WiFi_Version
    write               uci_restful -r /restful/hosttable/info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail    uci_restful: not found

uci_restful -r /restful/hosttable/info GET (continued part 2)
    [Tags]              Device.Hosts.Host.x.X_TMOBILE_WiFi_Encryption   Device.Hosts.Host.x.X_TMOBILE_Last_Connection_Error
    ...                 Device.Hosts.HostNumberOfEntries
    [Documentation]     Device.Hosts.Host.x.X_TMOBILE_WiFi_Encryption   Device.Hosts.Host.x.X_TMOBILE_Last_Connection_Error
    ...                 Device.Hosts.HostNumberOfEntries
    write               uci_restful -r /restful/hosttable/info GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail    uci_restful: not found

uci_restful -r /restful/mqttclient/client GET
    [Tags]              MQTT                                                 Device.MQTT.Client.{i}.Subscription.{i}.Topic
    ...                 Device.MQTT.Client.{i}.Subscription.{i}.QoS          Device.MQTT.Client.{i}.Subscription.{i}.Enable
    ...                 Device.LocalAgent.Controller.{i}.MTP.{i}.MQTT.Topic  Device.LocalAgent.Controller.{i}.MTP.{i}.MQTT.Reference
    #continued, 6 tags max
    [Documentation]     MQTT                                                 Device.MQTT.Client.{i}.Subscription.{i}.Topic
    ...                 Device.MQTT.Client.{i}.Subscription.{i}.QoS          Device.MQTT.Client.{i}.Subscription.{i}.Enable
    ...                 Device.LocalAgent.Controller.{i}.MTP.{i}.MQTT.Topic  Device.LocalAgent.Controller.{i}.MTP.{i}.MQTT.Reference
    write                uci_restful -r /restful/mqttclient/client GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail    uci_restful: not found  "no content"
    #should not contain  ${output}   no content

uci_restful -r /restful/mqttclient/client GET (continued part 1)
    [Tags]              MQTT                                    Device.MQTT.Client.{i}.Username
    ...                 Device.MQTT.Client.{i}.Password         Device.MQTT.Client.{i}.ClientID
    ...                 Device.MQTT.Client.{i}.BrokerAddress    Device.MQTT.Client.{i}.BrokerPort
    #continued, 6 tags max
    [Documentation]     MQTT                                    Device.MQTT.Client.{i}.Username
    ...                 Device.MQTT.Client.{i}.Password         Device.MQTT.Client.{i}.ClientID
    ...                 Device.MQTT.Client.{i}.BrokerAddress    Device.MQTT.Client.{i}.BrokerPort
    write               uci_restful -r /restful/mqttclient/client GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail    uci_restful: not found  "no content"
    #should not contain  ${output}   no content

uci_restful -r /restful/mqttclient/client GET (continued part 2)
    [Tags]              MQTT                                    Device.MQTT.Client.{i}.Enable
    [Documentation]     Device.MQTT.Client.{i}.Enable
    write               uci_restful -r /restful/mqttclient/client GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail    uci_restful: not found  "no content"
    #should not contain  ${output}   no content

uci_restful -r /restful/wifiap/ssid GET
    [Tags]                  Device.WiFi.xxx.SSID
    [Documentation]          Device.WiFi.xxx.SSID
    write                   uci_restful -r /restful/wifiap/ssid GET
    Set client configuration  prompt=#
    ${output}=              Read Until prompt
    should not contain  ${output}   fail    uci_restful: not found
    #should not contain  ${output}   no content

uci_restful -r /restful/wifiap/security GET
    [Tags]                  Device.WiFi.xxx.Security
    [Documentation]          Device.WiFi.xxx.Security
    write                   uci_restful -r /restful/wifiap/security GET
    Set client configuration  prompt=#
    ${output}=              Read Until prompt
    should not contain  ${output}   fail    uci_restful: not found
    #should not contain  ${output}   no content

uci_restful -r /restful/wifiap/version GET
    [Tags]                  Device.WiFi.xxx.Version
    [Documentation]          Device.WiFi.xxx.Version
    write                   uci_restful -r /restful/wifiap/version GET
    Set client configuration  prompt=#
    ${output}=                 Read Until prompt
    should not contain  ${output}   fail    uci_restful: not found
    #should not contain  ${output}   no content

uci_restful -r /restful/wifiap/encryption GET
    [Tags]                  Device.WiFi.xxx.Encryption
    [Documentation]          Device.WiFi.xxx.Encryption
    write                   uci_restful -r /restful/wifiap/encryption GET
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail    uci_restful: not found
    #should not contain  ${output}   no content

#Update LTE Cellular Interval Info
uci_restful -r /restful/lte/cellular_info_update_interval GET
    [Tags]                  cellular_info_update_interval
    [Documentation]          cellular_info_update_interval
    write                   uci_restful -r /restful/lte/cellular_info_update_interval GET
    #only activate this below to update the update interval
    #write                   uci_restful -r /restful/lte/cellular_info_update_interval PUT "{\"second\":\"1\"}"

uci template
    [Tags]  uci
    [Documentation]  uci
    write   uci
    Set client configuration  prompt=#
    ${output}=         Read Until prompt
    should not contain  ${output}   fail    uci_restful: not found
    should not contain  ${output}   no content

*** Keywords ***
Open Connection And Log In
   Open Connection     ${HOST}
   Login               ${USERNAME}        ${PASSWORD}
