<h1 id="setting-up-github-actions-oidc-authentication">Setting up GitHub Actions OIDC Authentication</h1>
<p>OpenID Connect (OIDC) allows your GitHub Actions workflows to access resources in Azure, without needing to store the Azure credentials as long-lived GitHub secrets.</p>
<h2 class="tabset tabset-pills" id="create-an-azure-active-directory-application-and-service-principal">Create an Azure Active Directory Application and Service Principal</h2>
<h3 id="azure-portal">Azure Portal</h3>
<p>If you do not have an existing application, register a new Azure Active Directory application and service principal that can access resources. As part of this process, make sure to:</p>
<p>Register your application with Azure AD and create a service principal Assign a role to the application Open App registrations in Azure portal and find your application. Copy the values for Application (client) ID and Directory (tenant) ID to use in your GitHub Actions workflow.</p>
<p>Open Subscriptions in Azure portal and find your subscription. Copy the Subscription ID.</p>
<h3 id="azure-cli">Azure CLI</h3>
<ol type="1">
<li><p>Create the Azure Active Directory application.</p>
<pre><code>az ad app create </code></pre>
<p>This command will output JSON with an appId that is your client-id. The objectId is APPLICATION-OBJECT-ID and it will be used for creating federated credentials with Graph API calls.</p></li>
<li><p>Create a service principal. Replace the $appID with the appId from your JSON output. This command generates JSON output with a different objectId will be used in the next step. The new objectId is the assignee-object-id.</p>
<pre><code>az ad sp create --id $appId</code></pre></li>
<li><p>Create a new role assignment by subscription and object. By default, the role assignment will be tied to your default subscription. Replace $subscriptionId with your subscription ID, $resourceGroupName with your resource group name, and $assigneeObjectId with generated assignee-object-id (the newly created service principal object id).</p>
<pre><code>az role assignment create --role contributor --subscription $subscriptionId --assignee-object-id  $assigneeObjectId --assignee-principal-type ServicePrincipal --scope /subscriptions/$subscriptionId/resourceGroups/$resourceGroupName</code></pre></li>
<li><p>Copy the values for clientId, subscriptionId, and tenantId to use later in your GitHub Actions workflow.</p></li>
</ol>
<h1 class="tabset tabset-pills" id="add-federated-credentials">Add federated credentials</h1>
<h2 id="azure-portal-1">Azure Portal</h2>
<ol type="1">
<li><p>Go to App registrations in the Azure portal and open the app you want to configure.</p></li>
<li><p>Within the app, go to Certificates and secrets.</p>
<figure>
<img src="./assets/2wXBeyizUL.png" alt="" /><figcaption>Certificates &amp; Secrets</figcaption>
</figure></li>
<li><p>In the Federated credentials tab, select Add credential. Add the federated credential</p>
<figure>
<img src="./assets/hBo6N5S7OQ.png" alt="" /><figcaption>Add Credential</figcaption>
</figure></li>
<li><p>Select the credential scenario GitHub Actions deploying Azure resources. Generate your credential by entering your credential details.</p>
<table>
<colgroup>
<col style="width: 20%" />
<col style="width: 43%" />
<col style="width: 36%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Field</strong></th>
<th><strong>Description</strong></th>
<th><strong>Example</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Organization</td>
<td>Your GitHub organization name or GitHub username.</td>
<td><code>contoso</code></td>
</tr>
<tr class="even">
<td>Repository</td>
<td>Your GitHub Repository name.</td>
<td><code>contoso-app</code></td>
</tr>
<tr class="odd">
<td>Entity type</td>
<td>The filter used to scope the OIDC requests from GitHub workflows. This field used to generate the <code>subject</code> claim.</td>
<td><code>Environment</code>, <code>Branch</code>, <code>Pull Request</code>,<code>Tag</code></td>
</tr>
<tr class="even">
<td>GitHub Name</td>
<td>The name of the environment, branch, or tag.</td>
<td><code>main</code></td>
</tr>
<tr class="odd">
<td>Name</td>
<td>Identifier for the federated Credential</td>
<td><code>contoso-deploy</code></td>
</tr>
</tbody>
</table>
<p>For a more detailed overview, see Configure an app to trust a GitHub repo. ##</p></li>
</ol>
