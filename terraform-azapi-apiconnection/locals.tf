locals {
  api_definitions = {
    excelonlinebusiness = {
      name        = "excelonlinebusiness",
      displayName = "Excel Online (Business)",
      description = "Excel Online (Business) connector lets you work with Excel files in document libraries supported by Microsoft Graph (OneDrive for Business, SharePoint Sites, and Office 365 Groups).",
      iconUri     = "[concat('https://connectoricons-prod.azureedge.net/releases/v1.0.1702/1.0.1702.3814/', parameters('connections_excelonlinebusiness_name'), '/icon.png')]",
      brandColor  = "#107C41",
      id          = data.azurerm_managed_api.managed_api.id,
      type        = "Microsoft.Web/locations/managedApis"

    },
    office365 = {
      name        = "[parameters('connections_office365_name')]",
      displayName = "Office 365 Outlook",
      description = "Microsoft Office 365 is a cloud-based service that is designed to help meet your organization's needs for robust security, reliability, and user productivity.",
      iconUri     = "[concat('https://connectoricons-prod.azureedge.net/releases/v1.0.1716/1.0.1716.3922/', parameters('connections_office365_name'), '/icon.png')]",
      brandColor  = "#0078D4",
      id          = data.azurerm_managed_api.managed_api.id,
      type        = "Microsoft.Web/locations/managedApis"
    },
    sharepointonline = {
      name        = "sharepointonline",
      displayName = "SharePoint",
      description = "SharePoint helps organizations share and collaborate with colleagues, partners, and customers. You can connect to SharePoint Online or to an on-premises SharePoint 2016 or 2019 farm using the On-Premises Data Gateway to manage documents and list items.",
      iconUri     = "https://connectoricons-prod.azureedge.net/u/jayawan/releases/v1.0.1697/1.0.1697.3786/sharepointonline/icon.png",
      brandColor  = "#036C70",
      id          = data.azurerm_managed_api.managed_api.id,
      type        = "Microsoft.Web/locations/managedApis"
    },
    teams = {
      name        = "teams",
      displayName = "Microsoft Teams",
      description = "Microsoft Teams enables you to get all your content, tools and conversations in the Team workspace with Microsoft 365.",
      iconUri     = "https://connectoricons-prod.azureedge.net/releases/v1.0.1714/1.0.1714.3897/teams/icon.png",
      brandColor  = "#4B53BC",
      id          = data.azurerm_managed_api.managed_api.id,
      type        = "Microsoft.Web/locations/managedApis"
    },
    wordonlinebusiness = {
      name        = "wordonlinebusiness",
      displayName = "Word Online (Business)",
      description = "Word Online (Business) connector lets you work with Word files in document libraries supported by Microsoft Graph (OneDrive for Business, SharePoint Online Sites, and Office 365 Groups).",
      iconUri     = "https://connectoricons-prod.azureedge.net/releases/v1.0.1718/1.0.1718.3944/wordonlinebusiness/icon.png",
      brandColor  = "#185ABD",
      id          = data.azurerm_managed_api.managed_api.id,
      type        = "Microsoft.Web/locations/managedApis"
    }
  }
}
