<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Confirmation_Email_to_Contact</fullName>
        <ccEmails>anisa_sh17@g-1w5o6h4asy43vzfy2oph8d2ta5sotdxgbm90zjqm4rq03dke1n.0o-1qtomeas.ap8.apex.salesforce.com</ccEmails>
        <description>Confirmation Email to Contact</description>
        <protected>false</protected>
        <recipients>
            <field>Meeting_with__c</field>
            <type>contactLookup</type>
        </recipients>
        <senderAddress>anisa.sh17@gmail.com</senderAddress>
        <senderType>OrgWideEmailAddress</senderType>
        <template>unfiled$public/Meeting_Confirmation_Email</template>
    </alerts>
    <rules>
        <fullName>Meeting Confirmation Email</fullName>
        <actions>
            <name>Confirmation_Email_to_Contact</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Meeting__c.Meeting_Requestor__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
