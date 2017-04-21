module Ctx
  # This isn't really ideal - I'd like to generate this code somehow
  # or change how context_event works. Some events here *are* missing,
  # as you'd never have any attributes that one would want to possibly match on.
  # You can of course still use the `Client#on_{{event}}` to handle an event
  # without checking for context.
  class Bot < Discord::Client
    context_event channel_create, Discord::Channel

    context_event channel_update, Discord::Channel

    context_event channel_delete, Discord::Channel

    context_event guild_create, Discord::Gateway::GuildCreatePayload

    context_event guild_update, Discord::Guild

    context_event guild_delete, Discord::Gateway::GuildDeletePayload

    context_event guild_ban_add, Discord::Gateway::GuildBanPayload

    context_event guild_ban_remove, Discord::Gateway::GuildBanPayload

    context_event guild_emoji_update, Discord::Gateway::GuildEmojiUpdatePayload

    context_event guild_integrations_update, Discord::Gateway::GuildIntegrationsUpdatePayload

    context_event guild_member_add, Discord::Gateway::GuildMemberAddPayload

    context_event guild_member_update, Discord::Gateway::GuildMemberUpdatePayload

    context_event guild_member_remove, Discord::Gateway::GuildMemberRemovePayload

    context_event guild_role_create, Discord::Gateway::GuildRolePayload

    context_event guild_role_update, Discord::Gateway::GuildRolePayload

    context_event guild_role_delete, Discord::Gateway::GuildRoleDeletePayload

    context_event message_create, Discord::Message

    context_event message_reaction_add, Discord::Gateway::MessageReactionPayload

    context_event message_reaction_remove, Discord::Gateway::MessageReactionPayload

    context_event message_reaction_remove_all, Discord::Gateway::MessageReactionRemoveAllPayload

    context_event message_update, Discord::Gateway::MessageUpdatePayload

    context_event message_delete, Discord::Gateway::MessageDeletePayload

    context_event presence_update, Discord::Gateway::PresenceUpdatePayload

    context_event typing_start, Discord::Gateway::TypingStartPayload

    context_event user_update, Discord::User

    context_event voice_state_update, Discord::VoiceState

    context_event voice_server_update, Discord::Gateway::VoiceServerUpdatePayload
  end

  struct Context(T)
    shortcut channel_create, Discord::Channel

    shortcut channel_update, Discord::Channel

    shortcut channel_delete, Discord::Channel

    shortcut guild_create, Discord::Gateway::GuildCreatePayload

    shortcut guild_update, Discord::Guild

    shortcut guild_delete, Discord::Gateway::GuildDeletePayload

    shortcut guild_ban_add, Discord::Gateway::GuildBanPayload

    shortcut guild_ban_remove, Discord::Gateway::GuildBanPayload

    shortcut guild_emoji_update, Discord::Gateway::GuildEmojiUpdatePayload

    shortcut guild_integrations_update, Discord::Gateway::GuildIntegrationsUpdatePayload

    shortcut guild_member_add, Discord::Gateway::GuildMemberAddPayload

    shortcut guild_member_update, Discord::Gateway::GuildMemberUpdatePayload

    shortcut guild_member_remove, Discord::Gateway::GuildMemberRemovePayload

    shortcut guild_role_create, Discord::Gateway::GuildRolePayload

    shortcut guild_role_update, Discord::Gateway::GuildRolePayload

    shortcut guild_role_delete, Discord::Gateway::GuildRoleDeletePayload

    shortcut message_create, Discord::Message

    shortcut message_reaction_add, Discord::Gateway::MessageReactionPayload

    shortcut message_reaction_remove, Discord::Gateway::MessageReactionPayload

    shortcut message_reaction_remove_all, Discord::Gateway::MessageReactionRemoveAllPayload

    shortcut message_update, Discord::Gateway::MessageUpdatePayload

    shortcut message_delete, Discord::Gateway::MessageDeletePayload

    shortcut presence_update, Discord::Gateway::PresenceUpdatePayload

    shortcut typing_start, Discord::Gateway::TypingStartPayload

    shortcut user_update, Discord::User

    shortcut voice_state_update, Discord::VoiceState

    shortcut voice_server_update, Discord::Gateway::VoiceServerUpdatePayload
  end
end
