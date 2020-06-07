# protest phone

|||
|---|---|
|![](https://raw.githubusercontent.com/wdbm/TFLOSSH/master/media/EZKCczgWkAAHPQw.jpg)|![](https://raw.githubusercontent.com/wdbm/TFLOSSH/master/media/EZotSWBXkAAPuUE.jpg)|

## introduction

You are being watched. Private and state-sponsored organisations are monitoring and recording your online and offline activities.

The intention of this page is to provide some easy-to-implement guidance for the setup of regular phones prior to their being used in a protest environment, and to provide some protections against spying and other breaches of rights that can happen via the state, corporate entities and fascist organisations. An attempt has been made to make the language reasonably non-technical. This page, unlike some of the other documentation in this repository, is not intended to provide a full guide to implementing a phone free of spyware, such as Google infrastructure common to Android, but is intended to provide a few relatively easy steps that can be implemented by relatively regular phones that could help to protect the rights of protestors.

Protest environments can feature dangers like spying and surveillance which can be used in both forceful and legal attacks and they also can feature attacks on the abilities of protestors to document and record evidence.

Privacy is important for at least three reasons. One is the right to privacy, such as that described roughly by [UDHR Articles 12 and 18](https://www.un.org/en/universal-declaration-human-rights). Another is to ensure that [fascism is not permitted to be efficient](https://www.ted.com/talks/yuval_noah_harari_why_fascism_is_so_tempting_and_how_your_data_could_power_it). Another is to ensure that protestors can protect themselves against repression. For example, the Hong Kong protestors can defend themselves from violence by organising where they move by communicating often in ways that are kept private and secure from repressive and violence forces.

This guide should help you make your regular phone a bit safer and a bit more on your side in the context of a protest environment.

![](https://raw.githubusercontent.com/wdbm/TFLOSSH/master/media/2019-08-15T1757Z.png)

## F-Droid

Install the [F-Droid applications repository](https://f-droid.org).

This is assumed for this documentation and can be done on regular phones. F-Droid is an applications repository like the Google Play Store but is dedicated exclusively to [free/libre and open source software](https://www.fsf.org/about/what-is-free-software).

## phone ergononics

Be sure to tie your hair back [using bobby pins](https://twitter.com/ava/status/1268054695446118402) and the like in order to make your phone easier to use.

## Signal

Install [Signal](https://signal.org) and get others to install it and test it.

Signal is an open source, end-to-end encryption instant messaging and voice calling application for Android, iOS and desktop. It can send one-to-one and group messages, which can include images, videos and other files, and it can make one-to-one voice calls. It is a reliable and proven solution for protection of privacy but it does not provide *anonymity* as it uses phone numbers for authentication. TL;DR: They will know you were using Signal but will be someway unlikely to be able to see what you were saying on it.

Note that WhatsApp, an application that is similar in some ways to Signal, should be considered spyware and insecure. It is made by a corporation that that claims that it is secure, but the fact that we cannot verify these claims means that we should not trust it.

When you use Signal, you can create chat groups on it with auto-deleting messages to protect your right to privacy. You should likely be *organising* in such a group, with messages autodeleting after perhaps an hour. It may be ok to have another group that autodeletes messages after a week in order to ensure that photographs and other forms of evidence are saved online and not just on your phone.

Unfortunately, Signal is dependent on the internet and is centralised. So, you need an internet connection to use it and you need the Signal computers to be switched on for it to work. Police and governments have the ability to switch off such servers, to switch off the internet, and to jam access to the internet using radio devices at protests.

## anonymous and peer-to-peer messaging

Some options for communications in the context of privacy, anonymity and peer-to-peer communications (i.e. when the internet has been switched off or jammed) are as follows.

### Briar

Install [Briar](https://f-droid.org/en/packages/org.briarproject.briar.android) ([APK](https://briarproject.org/apk/briar.apk)) and get others to install it and test it.

Briar is a peer-to-peer, device-to-device instant messages communications application. It can operate via Wi-Fi and Bluetooth and can synchronise via Tor if there is an internet connection. It does not rely on a central server. An account is stored only locally on the device.

When connecting two devices for the first time, this is done by scanning QR codes or by sending codes between contacts. One contact can "introduce" a contact to another contact for remote connections.

There are private groups (invitable only by the original creator, and dissolved when creator leaves) and public forums (invitable by any member, and dissolved when the last member leaves). Old messages are visible to new members of groups and forums. There are microblogs which are shared automatically with any contacts. Blog posts cannot be deleted. To set up a private group chat, in Private Groups, select the plus at top left. Contacts can be invited to the group.

Briar is compatible with panic button applications, such as the Guardian Project [Ripple](https://f-droid.org/en/packages/info.guardianproject.ripple).

While Briar is good to have as a backup to something like Signal, its abilities for relaying messages long distances via things like mesh networks are not completed yet.

- <https://twitter.com/BriarApp/status/938736196301271040>
    - <https://twitter.com/BriarApp/status/938740160782618627>
    - <https://twitter.com/BriarApp/status/939088183215755265>

### Manyverse

Install [Manyverse](https://f-droid.org/packages/se.manyver) and get others to install it and test it.

Manyverse is a social media system like Facebook that enables communications with both contacts nearby and over the internet. Manyverse does function but it is perhaps not as polished and reliable yet as Briar.

### Tox

Consider installing [Tox](https://f-droid.org/en/packages/com.zoffcc.applications.trifa). It is an older, though still well-considered, solution to internet-based peer-to-peer messaging and calling, though Briar in principle provides similar functionality so Tox may not be necessary.

## audio recorder

Install an audio recorder of some form that can continue recording with the phone screen locked. One option is [Audio Recorder](https://f-droid.org/en/packages/com.github.axet.audiorecorder).

## camera and video recorder

Ensure the phone can take photographs and can record video at the very least. A free and open source application that is useful for this is [OpenCamera](https://f-droid.org/en/packages/net.sourceforge.opencamera).

[The Guardian Project](https://guardianproject.info) provides [ObscuraCam: Secure Smart Camera](https://guardianproject.info/apps/obscuracam) for Android.

## lock the phone

Ensure the phone has its screen lock switched on (preferably using a passcode rather than a fingerprint, which states often have stored) in order to protect its running and to protect against tempering with evidence recorded by the phone.

# try to ensure the phone synchronises its data, automatically or manually

In addition to being able to send videos and so on manually online using an application like Signal, try to have the phone synchronise automatically to a system that makes photographs and videos you take get saved on computers elsewhere in case the phone is damaged or stolen. One (reliable, but spyware, option) for this is Dropbox. Another option (that requires more technical setup) is [Nextcloud](https://github.com/wdbm/resources_Nextcloud/blob/master/documentation/documentation.md).

## VPN -- provides internet privacy

A VPN service protects privacy by masking the IP address and encrypting internet traffic. It does not protect anonymity. It could be sensible to be using a VPN service, such as [NordVPN](https://nordvpn.com/bigmoney) or [AirVPN](https://github.com/wdbm/resources_AirVPN) in order to protect your privacy when making internet searches or when forced to used non-secure communications such as WhatsApp and Facebook Messenger.

## Tor -- provides internet anonymity

It is beyond the scope of this document to explain Tor. In short, it is an internet browser that provides anonymity. The combination of a VPN, which provides privacy, with Tor, which provides anonymity, is a natural one.

[The Guardian Project](https://guardianproject.info) provides [Orbot](https://guardianproject.info/fdroid) and [Orfox](https://guardianproject.info/fdroid) for Android.

## Jitsi and Periscope

Jitsi is a video meetings communications system that has some privacy protections. It could allow you to make live broadcasts that others could record remotely. It can be installed as a convenient [application](https://f-droid.org/en/packages/org.jitsi.meet) and can be used directly in a browser: [Jitsi Meet](https://meet.jit.si). Note that while Jitsi has end-to-end encryption, this is disabled by default and should be considered.

[Periscope](https://play.google.com/store/apps/details?id=tv.periscope.android) is a closed source option for broadcasting video and audio. It has been used with success in protest environments by [Unicorn Riot](https://unicornriot.ninja).

## application for taking notes

It can be helpful to have an application for taking notes, such as of vehicle identifications and police identifications. One application for this is [Omni-Notes](https://f-droid.org/packages/it.feio.android.omninotes.foss).

## police scanner

Sometimes it can be helpful in some places to have an application that streams audio from nearby police communications. Two possible solutions for thie are [Police Scanner](https://play.google.com/store/apps/details?id=police.scanner.radio.broadcastify.citizen) on Android and [5-0 Radio Police Scanner](https://apps.apple.com/us/app/5-0-radio-police-scanner/id356336433) on iOS.

## further guidance

Some more general, more more technical, guidance, see [the rest of the documentation](https://github.com/wdbm/TFLOSSH) in this repository. In particular, consider [setting up a phone that uses LineageOS](https://github.com/wdbm/TFLOSSH/blob/master/hlte.md) instead of Android, and that does not feature spyware like Google infrastructure. Also see other guidance, such as seeing the list of [other applications](https://github.com/wdbm/TFLOSSH/blob/master/applications.md) that might be useful in your particular situations.

There is other helpful guidance such as the following:

- [PrivacyTools](https://www.privacytools.io)
- [The Guardian Project](https://guardianproject.info)
- [ACLU apps to record police conduct](https://www.aclu.org/issues/criminal-law-reform/reforming-police/aclu-apps-record-police-conduct)

---

## Make days of war, nights of love and works of art

![](https://raw.githubusercontent.com/wdbm/TFLOSSH/master/media/1kUZ5LU.jpg)
